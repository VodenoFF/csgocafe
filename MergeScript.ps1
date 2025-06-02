# PowerShell script to merge csgocafe.cf and csgocafebot folders

# Define paths
$sourceFolder1 = "C:\Users\Administrator\Desktop\csgocafe.cf"
$sourceFolder2 = "C:\Users\Administrator\Desktop\csgocafebot"
$destinationFolder = "C:\Users\Administrator\Desktop\csgocafe-github"

# Create destination folder if it doesn't exist
if (-not (Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
    Write-Host "Created directory: $destinationFolder"
}

# Copy files from csgocafe.cf
Write-Host "Copying files from $sourceFolder1..."
Copy-Item -Path "$sourceFolder1\*" -Destination $destinationFolder -Recurse -Force -Exclude @("config.js", "steambot.config.js", ".git", "node_modules", "ssfn*")

# Copy files from csgocafebot
Write-Host "Copying files from $sourceFolder2..."
Copy-Item -Path "$sourceFolder2\*" -Destination $destinationFolder -Recurse -Force -Exclude @("config.js", "steambot.config.js", ".git", "node_modules", "ssfn*")

# Copy template files from merged folder
Write-Host "Copying template files..."
Copy-Item -Path "C:\Users\Administrator\Desktop\csgocafe-merged\config.template.js" -Destination "$destinationFolder\config.template.js" -Force
Copy-Item -Path "C:\Users\Administrator\Desktop\csgocafe-merged\steambot.config.template.js" -Destination "$destinationFolder\steambot.config.template.js" -Force
Copy-Item -Path "C:\Users\Administrator\Desktop\csgocafe-merged\.gitignore" -Destination "$destinationFolder\.gitignore" -Force
Copy-Item -Path "C:\Users\Administrator\Desktop\csgocafe-merged\README.md" -Destination "$destinationFolder\README.md" -Force
Copy-Item -Path "C:\Users\Administrator\Desktop\csgocafe-merged\DOCUMENTATION.md" -Destination "$destinationFolder\DOCUMENTATION.md" -Force

# Initialize Git repository
Write-Host "Initializing Git repository..."
Set-Location -Path $destinationFolder
git init
git add .
git commit -m "Initial commit - CS:GO Cafe Project"

Write-Host "Merge complete! Files are in $destinationFolder" 