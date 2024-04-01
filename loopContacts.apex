// Instantiate the Toolkit object
box.Toolkit boxToolkit = new box.Toolkit();

Contact[] cntcts = [SELECT Name, Box_Folder_ID__c FROM Contact WHERE Box_Folder_ID__c != null];
system.debug('contacts are ' + cntcts);

for (Contact i : cntcts){
    Id SFId = i.id;
    string newboxID = i.Box_Folder_ID__c;
    //put in a thing that searches for any already existing frups with that
    //SFId and deletes them
    box__FRUP__c myNewFrup = boxToolkit.createFolderAssociation(SFId,newboxID);
    system.debug('check out my new frup! :' + myNewFrup);
    system.debug('the problem making the frup was: ' + boxToolkit.mostRecentError);
    //add functionality to search for mactches by name in Box and create associations where the name of the SF and Box folders are the same
        //And then a version of that where maybe the user is asked to sign off on each one?
}

// ALWAYS call this method when finished.Since salesforce doesn't allow http callouts after dml operations, we need to commit the pending database inserts/updates or we will lose the associations created
boxToolkit.commitChanges();
