$script_name = "rclone-backup"
$Host.UI.RawUI.WindowTitle = "rclone-scheduled-backup"

$date = Get-Date -Format 'yyyy.MM.dd-HH.mm.ss'
$log = "$($script_name)_$($date).log"
New-Item -ItemType Directory -Path "$PSScriptRoot/logs" -Force | Out-Null
Start-Transcript -Path "$PSScriptRoot/logs/$log"

$drive = "gdrive:rclone"
$documents = "D:/Users/Hugo/Documents"
$appdata = "C:/Users/Hugo/AppData"
$options = @(
    "-v"
    "-P"
    "--exclude", ".gitignore"
    "--exclude", ".git/**"
    "--exclude", "**/.gitignore"
    "--exclude", "**/.git*/**"
    "--exclude", "**/*.log"
    "--exclude", ".log/**"
    "--exclude", "**/.log/**"
    "--exclude", "**/logs/**"
    "--exclude", "logs/**"
    # "--copy-links"
    # "--dry-run"
)

function upload {
    param (
        [string]$Name,
        [string]$Source,
        [string]$Destination,
        [string[]]$AdditionalOptions = @()
    )

    Write-Host "Uploading $Name..."
    Write-Host $date
    rclone copy $Source $Destination $options $AdditionalOptions
}

upload ".config" "$HOME/.config" "$drive/.config" @("--max-size", "10M")
upload "startup-scripts" "$documents/startup-scripts" "$drive/startup-scripts"
upload "EqualizerAPO config" "C:/Program Files/EqualizerAPO/config/config.txt" "$drive/equalizerapo/config"
upload "Curriculo" "$documents/Curriculo/" "$drive/curriculo"
upload "Scripts" "$documents/Scripts/" "$drive/scripts"
upload "AutoHotKey" "$documents/AutoHotKey/" "$drive/autohotkey"
upload "steam-rom-manager" "$HOME/AppData/Roaming/steam-rom-manager/userData/" "$drive/steam-rom-manager/userdata"
upload "Kanata" "C:/Aplications/Kanata/holdMotion.kbd" "$drive/kanata"
upload "Saves:KoeiTecmo" "$documents/System_Documents/KoeiTecmo/" "$drive/saves/koeitecmo"
upload "Saves:3DS" "D:/Games/!Emulation/3DS/#/.config/sdmc" "$drive/saves/3ds/sdmc"
upload "Saves:Xenia" "$documents/System_Documents/Xenia" "$drive/saves/xenia/"
upload "Saves:Tekken 7" "$HOME/AppData/Local/TekkenGame/Saved/SaveGames/TEKKEN7" "$drive/saves/tekken7"
upload "PowerShell config" "$documents/System_Documents/PowerShell" "$drive/powershell/"
upload "Mailspring config" "$appdata/Roaming/Mailspring/config.json" "$drive/mailspring"
upload "Mailspring keymap" "$HOME/AppData/Roaming/Mailspring/keymap.json" "$drive/mailspring"
upload "Browser history" "$appdata/Local/BraveSoftware/Brave-Browser/User Data/Default/History" "$drive/browser/chromium/history" 
upload "Browser history-journal" "$appdata/Local/BraveSoftware/Brave-Browser/User Data/Default/History-journal" "$drive/browser/chromium/history" 
upload "Browser Bookmarks" "$appdata/Local/BraveSoftware/Brave-Browser/User Data/Default/Bookmarks" "$drive/browser/chromium/bookmarks" 
upload "Browser Bookmark Merged" "$appdata/Local/BraveSoftware/Brave-Browser/User Data/Default/BookmarkMergedSurfaceOrdering" "$drive/browser/chromium/bookmarks" 
upload "Onedrive" "D:/OneDrive/" "$drive/onedrive" 

Stop-Transcript
# rclone tree "$drive" -all
