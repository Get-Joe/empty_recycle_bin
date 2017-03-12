# A script by Joe.
# The following is a script to remove items from the recycle bin based on the last time they were accessed.
# It is created for an enterprise environment.
# Further information can be found in the README file.

$objUser = New-Object System.Security.Principal.NTAccount("$env:UserName")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$Path = ('c\$Recycle.Bin\' + $strSID)
Get-ChildItem $Path -Force -Recurse -ErrorAction SilentlyContinue |
Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} |
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue