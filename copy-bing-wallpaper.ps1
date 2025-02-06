# Define paths
$sourcePath = "C:\Users\kevin\AppData\Local\Microsoft\BingWallpaperApp\WPImages"
$destinationPath = "C:\Users\lizke\OneDrive\Pictures\bing-wallpaper.jpg"

# Get the latest image
$latestImage = Get-ChildItem -Path $sourcePath | Sort-Object LastWriteTime -Descending | Where-Object { $_.Extension -match '\.jpg|\.jpeg|\.png' } | Select-Object -First 1

# Check if the latest image is valid and has a reasonable file size (e.g., > 100 KB)
if ($latestImage -and $latestImage.Length -gt 100KB) {
    # Copy the image to the destination
    Copy-Item -Path $latestImage.FullName -Destination $destinationPath -Force
    Write-Host "Wallpaper updated successfully."
} else {
    Write-Host "No valid image found or image size is too small."
}