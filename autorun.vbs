Function RunPowerShell(script)
    CreateObject("WScript.Shell").Run _
        "powershell.exe -NoProfile -WindowStyle Hidden -File """ & script & """", 0, False
End Function

RunPowerShell "D:/Users/Hugo/Documents/startup-scripts/rclone-backup.ps1"
