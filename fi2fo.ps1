# 📁 PowerShell Script: Organize Files into Folders

# 1. Set the target folder path (Use '.' for current folder, or specify e.g., 'C:\Users\Name\Documents')
$targetDir = "."

# 2. Get all files in the folder (skips existing directories)
Get-ChildItem -Path $targetDir -File | ForEach-Object {

    # Get the file name without extension for the folder name
    $folderName = $_.BaseName
    
    # Define full destination path
    $destinationPath = Join-Path -Path $_.DirectoryName -ChildPath $folderName

    # 3. Create the new folder if it doesn't exist yet
    if (-not (Test-Path -Path $destinationPath)) {
        New-Item -Path $destinationPath -ItemType Directory | Out-Null
    }

    # 4. Copy the file into the newly created folder
    #Copy-Item -Path $_.FullName -Destination $destinationPath
    # 4. Move the file into the newly created folder
    Move-Item -Path $_.FullName -Destination $destinationPath
}