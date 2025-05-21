# Fehlerverhalten einstellen
$ErrorActionPreference = "Stop"

# Animation Frames (Backslash doppelt escapen!)
$frames = @("|", "/", "-", "\\")

# C#-Code für Mausbewegung über Win32-API einbinden
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class MouseMover {
    [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
    public static extern void mouse_event(uint dwFlags, int dx, int dy, uint cButtons, UIntPtr dwExtraInfo);
    private const uint MOUSEEVENTF_MOVE = 0x0001;
    public static void MoveMouse(int pixels) {
        mouse_event(MOUSEEVENTF_MOVE, pixels, 0, 0, UIntPtr.Zero);
        System.Threading.Thread.Sleep(100);
        mouse_event(MOUSEEVENTF_MOVE, -pixels, 0, 0, UIntPtr.Zero);
    }
}
"@

# Startzeit erfassen
$scriptStartTime = Get-Date

Write-Host "Starte Mausbeweger mit Win32-API..." -ForegroundColor Cyan
Start-Sleep -Seconds 2

# Endlosschleife
while ($true) {
    try {
        # Maus real bewegen (100 Pixel hin und zurück)
        [MouseMover]::MoveMouse(100)
    } catch {
        Write-Host "Fehler bei der Mausbewegung: $_" -ForegroundColor Red
    }

    # Animation & Zeit-Anzeige für 2 Minuten
    $startTime = Get-Date
    $hashes = ""  # ← Hier: Rautenanzeige wird zu Beginn jeder 2-Minuten-Phase zurückgesetzt

    while ((Get-Date) - $startTime -lt [TimeSpan]::FromMinutes(2)) {
        foreach ($frame in $frames) {
            # Anzeige aktualisieren
            Clear-Host
            Write-Host "Bewege die Maus alle 120 Sekunden um 100 Pixel hin und her (Win32 API)" -ForegroundColor Green

            $elapsed = (Get-Date) - $scriptStartTime
            $runtime = "You have been green for {0:D2} minute(s) and {1:D2} second(s)!" -f $elapsed.Minutes, $elapsed.Seconds

            Write-Host "keep moving..." -ForegroundColor Green
            Write-Host $runtime -ForegroundColor Green

            $hashes += "#"
            Write-Host $hashes -ForegroundColor Green

            Write-Host $frame -NoNewline -ForegroundColor Green
            Start-Sleep -Milliseconds 100
        }
    }
}
