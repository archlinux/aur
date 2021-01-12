# Moving from Paradox Launcher to Irony Mod Mananger
1. Quit Stellaris and Stellaris (Paradox) Launcher
2. Unsubscribe from all mods. Stellaris Workshop -> Your files (under your avatar) -> Subscribed items - > Unsubscribe From All
3. Quit Steam
4. Go to `~/.steam/steam/steamapps/workshop/content/281990/` and delete everything
5. Go to `~/.local/share/Paradox Interactive/Stellaris/` and delete the following files:
	 + dlc_load.json
	 + game_data.json
	 + launcher-v2.sqlite
	 + mods_registry.json
	 + everything inside last_mods={ } in settings.txt
6. Restart Steam
7. Open Paradox launcher
8. Close Paradox launcher
9. Resubscribe to your mods
10. Wait until all downloads are done. Only then continue with step 11.
11. Start Paradox Launcher
12. Close Paradox launcher

You can now use Irony Mod Mananger
