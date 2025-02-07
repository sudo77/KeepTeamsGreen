# Frames for the spinning wheel animation
$frames = @(
    "|",
    "/",
    "-",
    "\"
)

# Display "keep moving..." text
Clear-Host
Write-Host "keep moving..." -ForegroundColor green

# Initialize the counter for the number of hashes
$hashes = ""

# Display spinning wheel animation
for ($i = 0; $i -lt 12; $i++) {
    $startTime = Get-Date
    while ((Get-Date) - $startTime -lt [TimeSpan]::FromSeconds(10)) {
        foreach ($frame in $frames) {
            Clear-Host
            Write-Host "keep moving..." -ForegroundColor green
            Write-Host $hashes -ForegroundColor Green
            Write-Host (" " * $i + $frame) -NoNewline -ForegroundColor Green
            Start-Sleep -Milliseconds 100
        }
    }
    # Add a new hash every 10 seconds
    $hashes += "#"
}