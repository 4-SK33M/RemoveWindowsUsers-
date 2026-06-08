# User Cleanup Scripts

This folder contains two Windows cleanup scripts designed to remove numbered user-profile folders from the `C:\Users` directory.

The scripts were originally created to help clean up a large number of student account folders from a college computer without having to manually delete each profile through File Explorer.

> **Warning:** These scripts permanently delete folders and their contents. Review the scripts carefully before running them, and test them in a safe environment first.

---

## Scripts Included

| File | Type | Purpose |
|---|---|---|
| `byMay_v2.ps1` | PowerShell script | Deletes numbered folders in `C:\Users` that were last modified before **May 1, 2023**. Includes a confirmation prompt before deletion. |
| `DeleteStudents.bat` | Batch script | Deletes all folders in `C:\Users` where the folder name starts with a number. This script does **not** check the modified date. |

---

## Overview

These scripts are intended for administrators who need to remove old or unwanted numbered student profile folders from Windows machines.

A folder is considered a match if its name begins with a number, such as:

```text
123456
20201234
987654Student
```

This helps target student folders or automatically generated profile folders while avoiding common Windows profile folders such as:

```text
Administrator
Default
Public
```

---

## What `byMay_v2.ps1` Does

The PowerShell script performs the following actions:

1. Sets the target directory to:

   ```powershell
   C:\Users
   ```

2. Sets the target date to:

   ```powershell
   May 1, 2023
   ```

3. Retrieves all folders inside the target directory.

4. Checks whether each folder name starts with a number.

5. Checks whether each matching folder was last modified before May 1, 2023.

6. Prompts the user for confirmation before deleting anything.

7. Deletes the folder contents and then deletes the folder itself.

8. Displays the path of each deleted folder.

### Safety Confirmation

The PowerShell script includes this confirmation prompt:

```powershell
$confirmation = Read-Host "Are you sure you want to proceed? (Type 'yes' to confirm)"
```

The deletion process only continues if the user types:

```text
yes
```

Any other response cancels the process.

---

## What `DeleteStudents.bat` Does

The batch script performs a faster cleanup process:

1. Sets the target directory to:

   ```bat
   C:\Users
   ```

2. Loops through all folders inside the target directory.

3. Checks whether each folder name starts with a number.

4. Deletes each matching folder and its contents using:

   ```bat
   rmdir /s /q
   ```

5. Displays the path of each deleted folder.

6. Shows `Done.` when the process is complete.

### Important Difference

Unlike `byMay_v2.ps1`, the `DeleteStudents.bat` script does **not** check the folder's modified date.

This means it will delete every folder in `C:\Users` that starts with a number, regardless of when it was last modified.

---

## Important Warning

Both scripts permanently delete folders and their contents.

Before running either script, carefully review the target directory:

```powershell
$directoryPath = "C:\Users"
```

or, in the batch file:

```bat
set "directoryPath=C:\Users"
```

Make sure this directory matches your intended cleanup location.

---

## Requirements

- Windows operating system
- Administrator privileges may be required
- PowerShell, if using `byMay_v2.ps1`
- Command Prompt or double-click execution, if using `DeleteStudents.bat`

---

## How to Use `byMay_v2.ps1`

1. Download or clone this repository.
2. Open PowerShell as Administrator.
3. Navigate to the folder containing the script.
4. Run the script:

   ```powershell
   .\byMay_v2.ps1
   ```

5. Type `yes` only if you are sure you want to delete the matching folders.

---

## How to Use `DeleteStudents.bat`

1. Download or clone this repository.
2. Review the script before running it.
3. Right-click `DeleteStudents.bat`.
4. Select **Run as administrator**.
5. The script will delete all numbered folders inside `C:\Users`.

You can also run it from Command Prompt:

```bat
DeleteStudents.bat
```

---

## Which Script Should You Use?

Use `byMay_v2.ps1` if you want a safer cleanup process that checks both:

- Folder names that start with a number
- Folders last modified before May 1, 2023

Use `DeleteStudents.bat` if you want a faster cleanup process and you are certain that every numbered folder inside `C:\Users` should be removed.

For safety, the PowerShell script is recommended for most situations.

---

## Recommended Improvements

Before using these scripts in a live environment, consider adding the following improvements:

- Add a dry-run mode to preview folders before deletion
- Add a log file to record deleted folders
- Add error handling for folders that cannot be accessed or deleted
- Add a safer default directory instead of `C:\Users`
- Add parameters so the directory and date can be changed without editing the script
- Add a confirmation prompt to `DeleteStudents.bat`
- Add a date check to `DeleteStudents.bat`

---

## Example Use Case

These scripts can be useful when an administrator needs to remove old numbered folders from a Windows machine, such as:

- Student profile folders
- Temporary user folders
- Archived profile folders
- Automatically generated account folders that are no longer needed

---

## Disclaimer

This was an experiemt :`)` Use these scripts at your own risk. Always test them in a safe environment before running them on important systems. The author is not responsible for accidental data loss caused by improper use.
