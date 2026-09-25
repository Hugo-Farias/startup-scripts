Function RunPowerShell(script)
    CreateObject("WScript.Shell").Run _
        "powershell.exe -NoProfile -File """ & script & """", 0, False
End Function

RunPowerShell "D:/Users/Hugo/Documents/startup-scripts/backup-taskScheduler.ps1"
RunPowerShell "D:/Users/Hugo/Documents/startup-scripts/rclone-backup.ps1"
