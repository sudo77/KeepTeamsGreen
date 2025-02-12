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

while ($true) {
    # Bewege die Maus um 1 Pixel hin und her
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class MouseJiggler {
        [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = StdCall)]
        public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
        public static void Jiggle() {
            mouse_event(0x0001, 1, 0, 0, 0); // Maus bewegen
            mouse_event(0x0001, -1, 0, 0, 0); // Maus zurückbewegen
        }
    }
"@

    [MouseJiggler]::Jiggle()

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