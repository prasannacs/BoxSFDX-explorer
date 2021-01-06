({
    doInit : function(component, event, helper) {
        
        var action = component.get("c.getBoxMap");
        var recordId = component.get("v.recordId");
        // var boxFolderId = component.get("v.caseRecord.BoxFolderId");
        // var caseNum = component.get("v.caseRecord.CaseNumber");
        action.setParams({ recordId: recordId });
        action.setCallback(this, function(response) {
        
                var boxMap = response.getReturnValue();            
                var accessToken = boxMap.token; 
                var folderId = boxMap.folderId;
                var logoUrl = component.get("v.logoUrl");
                console.log('folderId 10-- ',folderId);
                var explorer = new Box.ContentExplorer();
                var explorerContainer = component.find("explorer-container").getElement();
                var previewResource = $A.get("$Resource.preview");
                var baseURL = window.location.origin;
                explorer.show(folderId, accessToken, {
                    container: explorerContainer,
                    logoUrl: logoUrl,
                    autoFocus: true,
                    canPreview: true,
                    canDownload: true,
                    canUpload: true,
                    canCreateNewFolder: true,
                    canDelete: true,
                    canRename: true,
                    canShare: true,
                    canSetShareAccess: true,
                    staticHost: baseURL,
                    contentPreviewProps: {
                        staticPath: previewResource,
                        previewLibraryVersion: '2.12.0',
                        showAnnotations: true,
                        contentSidebarProps: {
                            detailsSidebarProps: {
                                hasNotices: true,
                                hasProperties: true,
                                hasAccessStats: true,
                                hasVersions: true
                            },
                            hasActivityFeed: true,
                            hasSkills: true,
                            hasMetadata: true
                        },
                        contentOpenWithProps: {
                            show: false
                        }
                    }
                });
        });
        $A.enqueueAction(action);
    }
    
})


({
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "LOADED") {
           // record is loaded (render other component which needs record data value)
            console.log("Record is loaded successfully. --- ");
            console.log("You loaded a record in " + 
                        component.get("v.caseRecord.CaseNumber"));
        } else if(eventParams.changeType === "CHANGED") {
            // record is changed
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted
        } else if(eventParams.changeType === "ERROR") {
            // there’s an error while loading, saving, or deleting the record
        }
    }
})