Write-Host  "Bewege die Maus alle 120 Sekunden um 1 Pixel hin und her" -ForegroundColor green
# Frames for the spinning wheel animation
#v1.2
$frames = @(
    "|",
    "/",
    "-",
    "\"
)

# Display "keep moving..." text
Write-Host "keep moving..." -ForegroundColor green

# Initialize the counter for the number of hashes
$hashes = ""

# Display spinning wheel animation
for ($i = 0; $i -lt 12; $i++) {
    $startTime = Get-Date
    while ((Get-Date) - $startTime -lt [TimeSpan]::FromSeconds(10)) {
        foreach ($frame in $frames) {
            Clear-Host
            Write-Host  "Bewege die Maus alle 120 Sekunden um 1 Pixel hin und her" -ForegroundColor green
            Write-Host "keep moving..." -ForegroundColor green
            Write-Host $hashes -ForegroundColor Green
            Write-Host (" " * $i + $frame) -NoNewline -ForegroundColor Green
            Start-Sleep -Milliseconds 50
        }
    }
    # Add a new hash every 10 seconds
    $hashes += "#"
}

Add-Type -AssemblyName System.Windows.Forms

while ($true) {
    # Bewege die Maus um 1 Pixel hin und her
    $pos = [System.Windows.Forms.Cursor]::Position
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($pos.X + 1, $pos.Y)
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.Cursor]::Position = $pos

    # Alle 2 Minuten ausführen
    $startTime = Get-Date
    while ((Get-Date) - $startTime -lt [TimeSpan]::FromSeconds(120)) {
        $innerStartTime = Get-Date
        while ((Get-Date) - $innerStartTime -lt [TimeSpan]::FromSeconds(10)) {
            foreach ($frame in $frames) {
                Clear-Host
                Write-Host  "Bewege die Maus alle 120 Sekunden um 1 Pixel hin und her" -ForegroundColor green
                Write-Host "keep moving..." -ForegroundColor green
                Write-Host $hashes -ForegroundColor Green
                Write-Host $frame -NoNewline -ForegroundColor Green
                Start-Sleep -Milliseconds 50
            }
        }
        # Add a new hash every 10 seconds
        $hashes += "#"
    }
}