public class BoxJWTController {

    // Pras - EID
    private static String enterpriseId = '439349919';
    private static String publicKeyId = 'pm5ttflk';
    private static String privateKey = '==ddgdfgdfjgdfgdfdfgdfgdkfjhgdkfhgkdgdjhfgkdhfg';
    private static String clientId = 'hpgo9mlkwbostl6oylb9h3h7ypr4qjqy';
    private static String clientSecret = 'RwYZ9JQuzdR0djMMKcYzEKDwuBkjhDj9';
    
    // FRB - EID
    // private static String enterpriseId = '345489527';
    // private static String publicKeyId = '6aijgx1w';
    // private static String privateKey = 'lk;fdlgdflgdf;lg;d'flg;d'flg;'dflg.dflg;'dfl'g;dflg';
    // private static String clientId = 'u9xz1qol2is56nm2qn67jb5zojhds67j';
    // private static String clientSecret = 'L2vPWizTyL0zXmMTQ7cAbS1ANJlH8DTO';
    private static BoxPlatformApiConnection serviceAccountApi;
    private static BoxPlatformApiConnection salesforceServiceAccountApi;

    public BoxJWTController()   {   
        BoxJwtEncryptionPreferences preferences = new BoxJwtEncryptionPreferences();
        preferences.setPublicKeyId(publicKeyId);
        preferences.setPrivateKey(privateKey);
        serviceAccountApi = BoxPlatformApiConnection.getAppEnterpriseConnection(enterpriseId, clientId, clientSecret, preferences);
        salesforceServiceAccountApi = BoxPlatformApiConnection.getAppUserConnection('13127279266', clientId, clientSecret, preferences);
    }

    public String token { get; set; }
    public String folderName { get; set; }
        
    private static BoxPlatformApiConnection getBoxConnection()    {
        BoxJwtEncryptionPreferences preferences = new BoxJwtEncryptionPreferences();
        preferences.setPublicKeyId(publicKeyId);
        preferences.setPrivateKey(privateKey);
        return BoxPlatformApiConnection.getAppEnterpriseConnection(enterpriseId, clientId, clientSecret, preferences);
    }
    
    private static BoxPlatformApiConnection getBoxUserConnection(String userId)	{
        BoxJwtEncryptionPreferences preferences = new BoxJwtEncryptionPreferences();
        preferences.setPublicKeyId(publicKeyId);
        preferences.setPrivateKey(privateKey);
        return BoxPlatformApiConnection.getAppUserConnection(userId, clientId, clientSecret, preferences);
    }

    @AuraEnabled(cacheable=true)
    public static String getBoxUserToken(String userId)	{
        BoxJwtEncryptionPreferences preferences = new BoxJwtEncryptionPreferences();
        preferences.setPublicKeyId(publicKeyId);
        preferences.setPrivateKey(privateKey);
        return BoxPlatformApiConnection.getAppUserConnection(userId, clientId, clientSecret, preferences).getAccessToken();
    }
    
    @AuraEnabled(cacheable=true)
    public static String method(String param)    {
        return 'Hello '+param;
    }
    
    @AuraEnabled(cacheable=true)
    public static BoxUser.Info createBoxAppUser(String param)    {
        
        BoxPlatformApiConnection api = getBoxConnection();
        System.debug('Connected to Box');
        List<BoxUser.Info> allUsers = BoxUser.getAllEnterpriseUsers(api);
        for (BoxUser.Info user1 : allUsers) {
            if( user1.name == param )   
                //return user1.id;
                return user1;
            }
        BoxUser.Info appUser = BoxUser.createAppUser(api, param);
        //return appUser.id;
        return appUser;
        
    }
    
    @AuraEnabled(cacheable=true)
    public static Map<String,String> getBoxMap(String recordId) {
        //String appUserId = createBoxAppUser(UserInfo.getUserEmail());
        BoxUser.Info appUser = createBoxAppUser(UserInfo.getUserEmail());
        String appUserId = appUser.id;
        
        //test();
        // Create the map to return to the lightning component
        Map<String,String> boxMap = new Map<String,String>();
        //String token = getBoxUserToken(appUserId);
        //hack with Salesforce service account
        String cacheKey = 'local.BoxCache.'+recordId;
        String folderId = '0';
        String token = '';
        if (Cache.Org.contains(cacheKey)) {
            folderId = (String)Cache.Org.get(cacheKey);
            token = getBoxUserToken('13127279266');
            boxMap.put('token', token);    
        } else {
            token = getBoxUserToken(appUserId);
            boxMap.put('token', token);   
        }
        boxMap.put('folderId', folderId);
        createCaseCollab(recordId,appUser.login);
        return boxMap;
    }

    @AuraEnabled(cacheable=true)
    public static String getBoxFolderId(String recordId)  {
        box__FRUP__c frup = [SELECT box__Folder_ID__c, box__Record_ID__c FROM box__FRUP__c WHERE box__Record_ID__c = :recordId LIMIT 1];
        return frup.box__Folder_ID__c;
    }

    @future(callout=true) 
    private static void createCaseCollab(String recordId, String appUserLogin)   {
            // Get the record folder
            box__FRUP__c frup = [SELECT box__Folder_ID__c, box__Record_ID__c FROM box__FRUP__c WHERE box__Record_ID__c = :recordId LIMIT 1];
            String folderId = frup.box__Folder_ID__c;
            System.debug('Found folder with id: ---- ' + folderId);
            if( folderId != null )  {
                BoxPlatformApiConnection api = getBoxUserConnection('13127279266');
                System.debug('Service account token ----' + api.getAccessToken());
                BoxCollaborator user = new BoxUser(api, '13127279266');
                BoxFolder folder = new BoxFolder(api, folderId);
                folder.collaborate(appUserLogin, BoxCollaboration.Role.EDITOR);
                System.debug('Collaboration complete: ---- ');
            }
    }
        
    @AuraEnabled(cacheable=true)
    public static String downscopeToken(String token) {
        String accessToken;
        String scopes = 'base_explorer item_download item_upload item_preview item_rename item_share item_delete';
        //String endpoint = 'https://api.box.com/oauth2/token';
        String endpoint = 'callout:BoxAPI/oauth2/token';
        String body = 'scope=' + scopes +
            '&grant_type=urn:ietf:params:oauth:grant-type:token-exchange' +      
            '&subject_token=' + token +
            '&subject_token_type=urn:ietf:params:oauth:token-type:access_token';

        // format Box API request to downscope token
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(endpoint);
        request.setBody(body);
        
        //Create Http, send request
        Http http = new Http();
        HTTPResponse response = http.send(request);
        String resBody = response.getBody();
        System.debug('Body of refresh response: ' + resBody);
        
        //loop through tokens to be parsed, save access token
        JSONParser parserTokens = JSON.createParser(resBody);
        while (parserTokens.nextToken() != null){
      
          if (parserTokens.getCurrentToken() == JSONToken.FIELD_Name &&
                parserTokens.getText() == 'access_token'){
            parserTokens.nextToken();
            //save access token
            accessToken = parserTokens.getText();
          }
        }
        
        return accessToken;        
    }
}
