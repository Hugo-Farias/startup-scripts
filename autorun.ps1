$drive = "gdrive:rclone"
$documents = "D:/Users/Hugo/Documents"
$options = @(
    "-v"
    "-P"
    # "--copy-links"
    "--exclude", "**/.git/**"
    "--exclude", "**/*.log"
    "--exclude", "**/.log/**"
    # "--dry-run"
)

rclone copy "D:/OneDrive/" "$drive/onedrive" $options
rclone copy "$HOME/.config" "$drive/.config" --max-size 10M $options
rclone copy "$documents/startup-scripts" "$drive/startup-scripts" $options
rclone copy "C:/Program Files/EqualizerAPO/config/config.txt" "$drive/equalizerapo/config" $options
rclone copy "$documents/Curriculo/" "$drive/curriculo" $options
rclone copy "$documents/Scripts/" "$drive/scripts" $options
rclone copy "$documents/AutoHotKey/" "$drive/autohotkey" $options
rclone copy "$HOME/AppData/Roaming/steam-rom-manager/userData/" "$drive/steam-rom-manager/userdata" $options
rclone copy "C:/Aplications/Kanata/holdMotion.kbd" "$drive/kanata" $options
rclone copy "$documents/System_Documents/KoeiTecmo/" "$drive/saves/koeitecmo" $options
rclone copy "D:/Games/!Emulation/3DS/#/.config/sdmc" "$drive/saves/3ds/sdmc" $options
rclone copy "$documents/System_Documents/Xenia" "$drive/saves/xenia/" $options
rclone copy "$documents/System_Documents/PowerShell" "$drive/powershell/" $options
rclone copy "$HOME/AppData/Local/TekkenGame/Saved/SaveGames/TEKKEN7" "$drive/saves/tekken7" $options

rclone copy "C:/Users/Hugo/AppData/Roaming/Mailspring/config.json" "$drive/mailspring" $options
rclone copy "$HOME/AppData/Roaming/Mailspring/keymap.json" "$drive/mailspring" $options

rclone copy "C:/Users/Hugo/AppData/Local/BraveSoftware/Brave-Browser/User Data/Default/History-journal" "$drive/browser/chromium/history" $options
rclone copy "C:/Users/Hugo/AppData/Local/BraveSoftware/Brave-Browser/User Data/Default/History" "$drive/browser/chromium/history" $options
rclone copy "C:/Users/Hugo/AppData/Local/BraveSoftware/Brave-Browser/User Data/Default/Bookmarks" "$drive/browser/chromium/bookmarks" $options
rclone copy "C:/Users/Hugo/AppData/Local/BraveSoftware/Brave-Browser/User Data/Default/BookmarkMergedSurfaceOrdering" "$drive/browser/chromium/bookmarks" $options

rclone tree "$drive" -all
