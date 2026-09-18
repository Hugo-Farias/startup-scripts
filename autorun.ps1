$drive = "gdrive:rclone"
$documents = "D:/Users/Hugo/Documents"
$exclusions = "**/.git/**"

rclone copy "$HOME/.config" "$drive/.config" -v -P --max-size 10M  --exclude $exclusions
rclone copy "C:/Program Files/EqualizerAPO/config/config.txt" "$drive/equalizerapo/config" -v -P --exclude $exclusions
rclone copy "$documents/startup-scripts" "$drive/startup-scripts" -v -P --exclude $exclusions
rclone copy "$documents/Curriculo/" "$drive/curriculo" -v -P --exclude $exclusions
rclone copy "$documents/Scripts/" "$drive/scripts" -v -P --exclude $exclusions
rclone copy "$documents/AutoHotKey/" "$drive/autohotkey" -v -P --exclude $exclusions
rclone copy "$HOME/AppData/Roaming/steam-rom-manager/userData/" "$drive/steam-rom-manager/userdata" -v -P --exclude $exclusions
rclone copy "C:/Aplications/Kanata/holdMotion.kbd" "$drive/kanata" -v -P --exclude $exclusions
rclone copy "D:/OneDrive/" "$drive/onedrive" -v -P --exclude $exclusions
rclone copy "$documents/System_Documents/KoeiTecmo/" "$drive/saves/koeitecmo" -v -P --exclude $exclusions
rclone copy "D:/Games/!Emulation/3DS/#/.config/sdmc" "$drive/saves/3ds/sdmc" -v -P --exclude $exclusions
rclone copy "$documents/System_Documents/Xenia" "$drive/saves/xenia/" -v -P --exclude $exclusions
rclone copy "$documents/System_Documents/PowerShell" "$drive/powershell/" -v -P --exclude $exclusions
rclone copy "$HOME/AppData/Local/TekkenGame/Saved/SaveGames/TEKKEN7" "$drive/saves/tekken7" -v -P --exclude $exclusions
rclone tree "$drive"
