public class BoxJWTController {

    // Pras - EID
    private static String enterpriseId = '439349919';
    private static String publicKeyId = 'pm5ttflk';
    private static String privateKey = 'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDMbYGf/82EV9J3nq01cB8+WT1yJenrK+HtyuNfEWchqULTx1CQBPwfVIU7ciLEOi5Ab4P0dOilH9V42NgLfUCiF6Bbo9noO9a4JCJdowgjMqSx188Ze9Ik2MKmTkyWESs4DKp7nxHZk6N4nlWQPe3WwS7g2NjLAM9/TrRQ0SInCPGRrmjYa+iAkMeY8h4ryZjPQA3sl+fettV6ylUnufj7AMLpiUeS+wSV53ex88gc6dAhgnu0hjtzuYog9qkWBLLctkkPUpn9/ln3qqMBvLmiTMHwJflyhquUSP5FONBfvBX1pESdsZGNFkUTodo3u+BpRfS91Dp4cSXSmedJ9K5RAgMBAAECggEBAIRdx5gVJzqxLts7iEXYsrJJUEsQF5Wp1WGGhJDzEMcv9NBx9005nRKgRKCIN9C9J2ObkWKBLH52zV+xcLqHwIj0KWYNAzSnQlH7O7FLtiIsUY3CAhwrG5e2LttGSbrFpSlmsiDXj9RFD40zYI3EO7NZZQQ8BKv1e2WgTYsizy1cKLj0CaaK9CQmGKuz9uDyntcb7IdKFRhCAikWNqRL89wpj/4A18VVZbZgvY0yaGrpKwcav7WG6msrKuIugkP+BVNzBAeGCFwlwvk2gbO2mMKo8zGs3BSx9pKxKNqbw7/kfWLcy2XDQtTSa71hADlM+WI/fFZrizCeGCJohFVo1p0CgYEA+hECWImTHleDe9cc7C8JUKp0NsKLr5et1Vz0KAUqZnwrwPBFtEuaNzo1elQGMe+bVx1JjsLgqxFOX8NcakO7ypVy9JswGomhcAEbs70kyoOhjmZ3+zk03QMoJvKc65gWALS/4YVD2DmV1dOU0wiA99uWWySz7k5PZOzWzvkuCiMCgYEA0UdFmxNzYYcSLXGa+cTCEZv3/xTq1pldEgb4YK0AwgPHhgiIq3mi0X99rJCGaSWFT5NqzjYe61Pmd/sgomg6KtpgMA4GIe8FLDusN9jBlNN0P/SamWaxEAAQ9agjPIQtTjmGaczsuNAZyKmytUICRlly956FKVk74HhMwgwtKvsCgYEAhWM5SxznWtH3ksFl7h4Q6/RgVS1k8V8JHLyeiBJpUY1+kUYZCFkjg74K9JuJSm2zAL7gk8Qjr1xl3/MHgq9qpl8dmJiHCkDL2kDdE/0aeOPJ83l5GoqjRhj++/eB+LGBWxMPHy7Ex7u/zvUzd3YbxRpek3N6fu1KsF0dH/4Ort0CgYA8M/mVG+pUQwv6oLTJZ03AzRJxge3woBvDBNhMz1fpeDbcmvXeBlbNV5SqoMTZ2J5Z/vl5qt4IKpGhME/6CGu7SijjihU/i8f8KopnYmaFzrKhd1dGC+GhzbMTSDQiw49Y8nl1VCtBGzRfolmzhPKslCzbiPGbrHzqHRFPvTr9IwKBgQCiJe7E9fxhqC14h2hRf99W29QISxc5ImkLNIx+WW3ewApfXyXM4wx4k1sxl0kOttz4pFF0x6DlaehrYvdkrNZFfSH3dIMDg/naS/4KoFRkmPE4t/0oViqBEpIKmdJDV0miNWz7pRLVCYfUXSG5+BIQvzBPAbHrgXdP+gMAMK1iOg==';
    private static String clientId = 'hpgo9mlkwbostl6oylb9h3h7ypr4qjqy';
    private static String clientSecret = 'RwYZ9JQuzdR0djMMKcYzEKDwuBkjhDj9';
    
    // FRB - EID
    // private static String enterpriseId = '345489527';
    // private static String publicKeyId = '6aijgx1w';
    // private static String privateKey = 'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDZrz1DoeuBW2zVFz2rvz2zK3yAsUDLR9L4f6NBmLsW0ljCVZaVNiXeQxyha2US0T3KVWctOQvLyizMMhh1NqSig04ncA5l3LLA8eqSFphGpr6ez7+GE7RAwXrVS7Hhwmq61L4oUbx+zpOFCXz/VfS+KC7J+wcCA5R07Sz8eyLshWOvIfy2hRHGlQUujU2xzt3IXIhmQ270mFsoNbdBVj/52vgn3zwHWC+g/W4NfflupA1KFBe/0Aw9l/I/T/YoD9ywNKCmEMgISH8IMZUgqwEsTqSaJUBnm0kUnoOFQUZskwIdsJONyHsYX24bzYzBoMEnT+4aElaIdbLtW/mHyQ5PAgMBAAECggEAXRiw3sfU7FGpTcjOuzDitkmWyYME7uscsuIDc/5ZpPz4sMPhzpaFw3R4PiCr7UxHXM0BfzmybcldN0cFZruj1UzKk9s8jRvB5vqPE0NOhIizZT/77N9oa3lTiv0Aaki3VIe/e4bZUnIObQsNxjWAogKVYBRXfukBCLCWWLRgzz3C4ezk3e7cxV0B9mqD5B+exL7CFN3nXBhN6qUvmeptUDbnFv83bNcJLfupI0j7Wenra3vqU7v0e7y9gzTpi8ceS6iwwSOrgQ4jgfjY+D598QUMYrjRtayz6vdBh4R8xF+eCPh44JLPDPhFKxcOsUw1mGR7dS4hDUnIXk3wjZWqwQKBgQDupRYhmh8E37VKEVn3nNxc3qjFq/SKUE6VdLP9RPrLzmrJ0uyOGcjzjD717JdSY+8wItmHeGRS/oURqQcNWlBHO59vRq6ETUvDJbu+xaArkIIeNMIDA16geHw5qTvFAtSacBvcJr0lBQXQ9z0bNFym8ZISIsIiRWHOond1rgYMOQKBgQDpg+3DHkOu0otXamT3Up9llNquWD+n8GS3dlGpoFgGy+8cDAovjaIIHn28yYbVfN3OrC9wwKjFfQaXFE7bkl+Dv0T1XZb6ggOroCVvBmVZEMr6SW1t2b9nCGT1zcp/wtlPKGNp+bwYcXhbUBNCPGNG2Z5CB4UyJfhUTsfh0p3+xwKBgQCZ6PjEBR06THkkYtpuOslYT/XzPrqBNdfoxhKLJqDFLsRqk9EiuHiEso+slcDmTzNlDSTUHQ4/BI2X3TaCIxwhRM/HuYM2Ko/RNRXHrLdnQVTZ3FbAEL1Hq00a9w1oOzIYxHMDYiycooekxL+xOu0CckwtzCL+bVbuKJP43pph6QKBgBpbNqnQL6l6wBl0u8Kig7UucOQ+t6iX3HZMl3kCzQyvVeSfg0LMxJ4P+vck8+ACwPJDwvMB+8qWivjgZOopgjhXjUv4bUMHC60CXVdDrIq59376bKx6aD0T2HlZ6eIztt1VXKsocc98dy4vQo02TapAg7lGKgV3/aheX/cgE48fAoGBAMIxiYTyzcdEh8vDb6SjYC0bl8CEnmRRW04ixZkNtoHYajtFeDdxoHgJCeXCBLJwiDIST9bXQrddDKtwUyTTqZ48PuEWE8+vGvRb6IM7hVi+7pgonSqg/kyOBGfb+RZ6t05XnGkV0ooVp+KqJdlkFJ4qqjpHA92K1rweyM4Tpcvk';
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