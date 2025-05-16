Write-Host "Bewege die Maus alle 120 Sekunden um 1 Pixel hin und her" -ForegroundColor Green

# Animation Frames
$frames = @("|", "/", "-", "\")

# Initialisierung
$hashes = ""
Add-Type -AssemblyName System.Windows.Forms

# Startzeit erfassen
$scriptStartTime = Get-Date

# Erste 2 Minuten Animation
for ($i = 0; $i -lt 12; $i++) {
    $startTime = Get-Date
    while ((Get-Date) - $startTime -lt [TimeSpan]::FromSeconds(10)) {
        foreach ($frame in $frames) {
            Clear-Host
            Write-Host "Bewege die Maus alle 120 Sekunden um 1 Pixel hin und her" -ForegroundColor Green

            # Laufzeit berechnen und anzeigen
            $elapsed = (Get-Date) - $scriptStartTime
            $runtime = "You have been green for {0:D2} minute(s) and {1:D2} second(s)!" -f $elapsed.Minutes, $elapsed.Seconds
            Write-Host "keep moving..." -ForegroundColor Green
            Write-Host $runtime -ForegroundColor Green

            # Fortschritt und Frame anzeigen
            Write-Host $hashes -ForegroundColor Green
            Write-Host (" " * $i + $frame) -NoNewline -ForegroundColor Green
            Start-Sleep -Milliseconds 50
        }
    }
    $hashes += "#"
}

# Weitere 2 Minuten mit Mausbewegung
$totalStart = Get-Date
while ((Get-Date) - $totalStart -lt [TimeSpan]::FromMinutes(2)) {
    # Maus bewegen
    $pos = [System.Windows.Forms.Cursor]::Position
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($pos.X + 10, $pos.Y)
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.Cursor]::Position = $pos

    # Animation und Zeit-Anzeige für 2 Minuten
    $startTime = Get-Date
    while ((Get-Date) - $startTime -lt [TimeSpan]::FromSeconds(120)) {
        $innerStartTime = Get-Date
        while ((Get-Date) - $innerStartTime -lt [TimeSpan]::FromSeconds(10)) {
            foreach ($frame in $frames) {
                Clear-Host
                Write-Host "Bewege die Maus alle 120 Sekunden um 1 Pixel hin und her" -ForegroundColor Green

                # Laufzeit berechnen und anzeigen
                $elapsed = (Get-Date) - $scriptStartTime
                $runtime = "You have been green for {0:D2} minute(s) and {1:D2} second(s)!" -f $elapsed.Minutes, $elapsed.Seconds
                Write-Host "keep moving..." -ForegroundColor Green
                Write-Host $runtime -ForegroundColor Green

                Write-Host $hashes -ForegroundColor Green
                Write-Host $frame -NoNewline -ForegroundColor Green
                Start-Sleep -Milliseconds 50
            }
        }
        $hashes += "#"
    }
}
