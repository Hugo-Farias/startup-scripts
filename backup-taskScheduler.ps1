$backupPath = "D:\OneDrive\Backup\TaskScheduler"
New-Item -ItemType Directory -Path $backupPath -Force

# Get tasks only from the "TrustedApps" folder
Get-ScheduledTask -TaskPath "\TrustedApps\" | ForEach-Object {
    # Replace any invalid file name characters with an underscore
    $taskName = $_.TaskName -replace '[\\/:*?"<>|]', '_'
    $taskXmlPath = Join-Path -Path $backupPath -ChildPath "$taskName.xml"
    Export-ScheduledTask -TaskName $_.TaskName -TaskPath $_.TaskPath | Out-File -Encoding utf8 $taskXmlPath
}

Write-Output "Tasks Backup completed at $backupPath"
