##This is a powershell script to remove older items from the recycle bin. 
The conditions this was designed for are as follows. This may not work as intended if you do not fulfil the following.

1. You work in an Enterprise Domain.
2. You have rights to execute Powershell scipts across the domain.
3. Preferably you have access to to manage Group Policy, including the ability to sign scrypts and set log on scrypts.

##Some things about Windows and the recycle bin in an Enterprise Domain.

1. Each user's Recycle Bin is located in a hidden folder at | Fill in File Path |.  
2. Their naming convention follows a pattern | Fill in Naming Convention |.
3. Each user only has permissions to their own Recycle Bin and should ony affect their own.
4. By default the Recycle Bin has a maximum percentage of the hard drive, which is regulated by Group Policy.

##The following is a break down of the various components of the scrypt.

1. First 3 lines up to the Pipe, pull the SID of the currently logge on user and creates a variable with the full recycle bin path.
2. Next line pulls the user's recycle bin.
3. From the recycle bin, pulls the items with a last write time of (in this case) more than 30 days.
4. Removes all of the items from the user's recycle bin that fit that criteria.