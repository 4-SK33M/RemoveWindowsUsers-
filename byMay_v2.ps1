# Set the path to your directory
$directoryPath = "C:\Users"

# Set the target date (May 2023)
$targetDate = Get-Date "2023-05-01"

# Get all folders in the directory
$folders = Get-ChildItem -Path $directoryPath -Directory

# Prompt for user confirmation
Write-Host "This script will delete folders older than May 2023."
$confirmation = Read-Host "Are you sure you want to proceed? (Type 'yes' to confirm)"

# Check user confirmation
if ($confirmation -eq 'yes') {
    # Loop through each folder
    foreach ($folder in $folders) {
        # Check if the folder name starts with a number
        $firstChar = $folder.Name[0]
        if ($firstChar -ge '0' -and $firstChar -le '9') {
            # Get the last modified date of the folder
            $lastModifiedDate = $folder.LastWriteTime

            # Compare the last modified date with the target date
            if ($lastModifiedDate -lt $targetDate) {
                # Remove the contents of the folder
                Remove-Item -Path $folder.FullName\* -Recurse -Force

                # Remove the folder itself
                Remove-Item -Path $folder.FullName -Force
                Write-Host "Deleted: $($folder.FullName)"
            }
        }
    }

    Write-Host "PowerShell script completed."
} else {
    Write-Host "Deletion process canceled."
}

Pause
