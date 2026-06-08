# User Cleanup Script

A simple PowerShell script that scans a target directory and deletes folders that meet specific cleanup criteria. The script is currently configured to check folders inside `C:\Users` and remove folders that were last modified before **May 1, 2023**, but only if the folder name begins with a number. 
## Overview

This script can delete user accounts from the User ```powershell 
C:\Users
```
directory without having to deal with the long waiting time with explorer.exe. This was orginally designed to clean up a large volume of student accounts from a college I used to work for. You can modify it however you like.

## What the Script Does

The script performs the following actions:

1. Sets the target directory to:

   ```powershell
   C:\Users
   ```

2. Sets the target date to:

   ```powershell
   May 1, 2023
   ```

3. Retrieves all folders in the target directory.

4. Checks each folder to see whether the folder name starts with a number.

5. Checks whether the folder was last modified before May 1, 2023.

6. Deletes the folder contents and then deletes the folder itself.

7. Displays the path of each deleted folder.

## Important Warning

This script permanently deletes folders and their contents. Use it with caution.

Before running it, carefully review the following values in the script:

```powershell
$directoryPath = "C:\Users"
$targetDate = Get-Date "2023-05-01"
```

Make sure the directory and date match your intended cleanup requirements.

## Safety Confirmation

The script includes a confirmation prompt before deleting anything:

```powershell
$confirmation = Read-Host "Are you sure you want to proceed? (Type 'yes' to confirm)"
```

The deletion process will only continue if the user types:

```text
yes
```

Any other response cancels the process.

## Requirements

- Windows operating system
- PowerShell
- Administrator privileges may be required, depending on the folders being deleted

## How to Use

1. Download or clone this repository.
2. Open PowerShell.
3. Navigate to the folder containing the script.
4. Run the script:

   ```powershell
   .\byMay_v2.ps1
   ```

5. Type `yes` only if you are sure you want to delete the matching folders.

## Recommended Improvements

Before using this script in a live environment, consider adding the following improvements:

- A dry-run mode to preview folders before deletion
- A log file to record deleted folders
- Error handling for folders that cannot be accessed or deleted
- A safer default directory instead of `C:\Users`
- A parameter-based design so the directory and date can be changed without editing the script

## Example Use Case

This script can be useful when an administrator needs to remove old numbered folders from a Windows machine, such as temporary user folders, archived profile folders, or automatically generated folders that are no longer needed.

## Disclaimer

Use this script at your own risk. Always test in a safe environment before running it on important systems. The author is not responsible for accidental data loss caused by improper use.
