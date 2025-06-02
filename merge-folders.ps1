# Merge-Folders.ps1
# Script to merge csgocafe.cf and csgocafebot folders into a single GitHub-ready project

# Define source and destination paths
$sourceFolder1 = "C:\Users\Administrator\Desktop\csgocafe.cf"
$sourceFolder2 = "C:\Users\Administrator\Desktop\csgocafebot"
$destinationFolder = "C:\Users\Administrator\Desktop\csgocafe-merged"

# Create destination folder if it doesn't exist
if (-not (Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

# Function to copy files with exclusions
function Copy-FilesWithExclusions {
    param (
        [string]$source,
        [string]$destination,
        [array]$excludedFiles
    )

    # Get all items in the source folder
    $items = Get-ChildItem -Path $source -Recurse

    foreach ($item in $items) {
        # Check if the item should be excluded
        $excludeItem = $false
        foreach ($excluded in $excludedFiles) {
            if ($item.FullName -like "*$excluded*") {
                $excludeItem = $true
                break
            }
        }

        if (-not $excludeItem) {
            # Get the relative path
            $relativePath = $item.FullName.Substring($source.Length)
            $targetPath = Join-Path -Path $destination -ChildPath $relativePath

            if ($item.PSIsContainer) {
                # Create directory if it doesn't exist
                if (-not (Test-Path $targetPath)) {
                    New-Item -ItemType Directory -Path $targetPath | Out-Null
                }
            }
            else {
                # Create parent directory if it doesn't exist
                $parentDir = Split-Path -Path $targetPath -Parent
                if (-not (Test-Path $parentDir)) {
                    New-Item -ItemType Directory -Path $parentDir | Out-Null
                }
                
                # Copy the file
                Copy-Item -Path $item.FullName -Destination $targetPath -Force
            }
        }
    }
}

# List of files to exclude
$excludedFiles = @(
    "steambot.config.js",
    "config.js",
    "ssfn*",
    ".git",
    "node_modules"
)

# Copy files from source folders to destination
Write-Host "Copying files from $sourceFolder1 to $destinationFolder..."
Copy-FilesWithExclusions -source $sourceFolder1 -destination $destinationFolder -excludedFiles $excludedFiles

Write-Host "Copying files from $sourceFolder2 to $destinationFolder..."
Copy-FilesWithExclusions -source $sourceFolder2 -destination $destinationFolder -excludedFiles $excludedFiles

# Copy template files
Write-Host "Copying template configuration files..."
Copy-Item -Path "$sourceFolder1\config.template.js" -Destination "$destinationFolder\config.template.js" -Force
Copy-Item -Path "$sourceFolder1\steambot.config.template.js" -Destination "$destinationFolder\steambot.config.template.js" -Force
Copy-Item -Path "$sourceFolder1\README.md" -Destination "$destinationFolder\README.md" -Force
Copy-Item -Path "$sourceFolder1\.gitignore" -Destination "$destinationFolder\.gitignore" -Force

Write-Host "Folder merge complete. The merged project is available at: $destinationFolder" 