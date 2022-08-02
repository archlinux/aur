## 2022.7.28-brescia-2 - 2022-07-31

### Hotfix

* fix #1873
* fix #1859
* fix FSR support for gamescope 777d8fd

## 2022.7.28-brescia-1 - 2022-07-29

### Hotfix

* fix regression in Offline mode

## 2022.7.28-brescia - 2022-07-28

### News

* New versioning system which allow versioning the whole bottle (also configuration)
* Automatic versioning can now be toggled on and off
* Exclude paths from versioning using patterns
* Use compression for versioning states
* Improve Launch Options saving without update the UI multiple times
* Improved YAML performance using libyaml (the python-yaml package must provide support for it)
* New About dialog
* Covers support in Library mode (thanks to SteamGridDB)
* Removed DXVK HUD option, use the Environment Variables section instead
* bottles-cli shell option now provide command output
* The Health Check is now in the About´s Troubleshooting section
* Extended Core dependencies check, packagers are invited to double-check their packages
* New default permission for the Flatpak package: xdg-download
* Added credits for Third-Party Libraries in the Credits section
* Minor UI improvements

### Fixes

* Fix for skipable onboard dialog
* Fix for empty bottle name
* Fix gstreamer libs for win32 bottles
* Fix for RemoteDisconnected error causing a crash
* Fix wrong Vaniglia listing
* Fix templates being generated with symlinked paths causing loops
* Fix configuration migration causing a crash when the user altered the configuration
* Fix mscoree.dll not found
* Fix regression for the -b option of the legacy bottles cli
* Fix Steam Launch Options parser causing a crash
* Fix a regression in the Add to Steam button not adding the new entry in Steam

### Translations

* Finnish translations thanks to Jiri Grönroos
* French translations thanks to @rjousse18, @julroy67
* Indonesian translations thanks to @liimee
* Russian translations thanks to @Knebergish, @lenemter, @Smoque
* Thai translations thanks to @SashaPGT
* Spanish translations thanks to Pablo Munoz Alabau, @oscfdezdz
* Italian translations thanks to @gdonisi
* Portuguese (Brazil) translations thanks to @geraldohomero
* German translations thanks to Patrick Ulbricht
* Croatian translations thanks to @milotype



## 2022.7.14-brescia-3 - 2022-07-15

### Hotfix

* fix "Add to Steam" (again)

## 2022.7.14-brescia-2 - 2022-07-15

### Hotfix

* fix "Add to Steam"
* fix migration from old bottles config

## 2022.7.14-brescia-1 - 2022-07-14

### Hotfix

* fix installers fail due to wrong ConfigManager handling

## 2022.7.14-brescia - 2022-07-13

### News

* New experimental feature: sandbox per bottle
* Soda is the default runner based on Valve's Wine plus some TKG/GE patches
* Installers has a new refreshed UI with more info and tracking process
* Ubisoft Connect integration
* Wine LoL runners are now unlocked in Flatpak
* New "standalone" option in bottles-cli to generate a custom script for running programs in a bottle without passing though Bottles
* Some performance improvements
* New CLI download progress bar with speed, size and eta
* New SteamManager which improve performances a bit
* Improved UI for experimental library mode
* Discovered Epic Games are now launched brought the Epic Games Store, using Cloud Sync and Anti cheat
* Core dependencies are now checked on boot on non Flatpak packages
* Now setting the env var DXVK_CONFIG_FILE=bottle_root will automatically point to the dxvk.conf file in the bottle root
* Some dialogs improvements (thanks to @TheEvilSkeleton)
* A dialog warning of the sandbox is shown by launching the first executable
* Improved bottle template caching for smallest sizes
* Runners now show a description of their purpose and composition
* Minor UI improvements

### Fixes

* Fix for broken templates not being re-generated
* Fix dependencies keys not being removed on uninstall
* Fix duplicated dependencies on re-install
* Fix a regression in hiding auto-discovered programs
* Fix a regression in adding entries to the library, were not supporting the new programs structure
* Fix Wine-GE builds being detected as Proton builds (thanks to @nicobatty)
* Fix a regression in the issues similarity check for the crash report dialog
* Fix issue of being able to add colon to bottle name (thanks to @axtloss)
* Fix issue of invisible checkbox in 'launch as terminal' dropdown (thanks to @axtloss)
* Fix a bug in External_Programs migration when its structure was compromised
* Fix duplicated programs when re-executing installers
* Fix UI disappearing on two-finger swipe
* Fix a regression in Environment Variables dialog not storing new entries on first save
* Fix states not being displayed on first state generation
* Fix regression in bottles-cli edit option

### Translations

* Vietnamese translations thanks to @lebao3105, @CuCai2413
* Chinese (Simplified) translations thanks to Eric
* Dutch translations thanks to @flipflop97
* Norwegian translations Bokmål thanks to Stian Øverbye
* Russian translations thanks to @Knebergish, Nikita Epifanov, @Smoque
* Czech translations thanks to @vikdevelop
* Polish translations thanks to @Mikutut
* Catalan translations thanks to @rogervc
* Swedish translations thanks to @alvarlagerlof, @Lemonmeth
* Japanese translations thanks to @ryonakano
* Hungarian translations thanks to @Jabybaby
* Serbian translations thanks to Andrija Djakovic
* Indonesian translations thanks to @engkih
* Portuguese (Brazil) translations thanks to @vitorhcl
* Korean translations thanks to @PolyPaul


##  2022.6.28-brescia - 2022-06-27

### News

* Support for Steam Proton prefixes
* Option to list programs from Epic Games Store
* New path for shader cache (auto-migrated)
* Mesa shader cache is now stored in the bottle
* VKD3D shader cache is now stored in the bottle
* Update Bottles Runtime to 0.5
* Initial support for EAC Runtime
* Initial support for Battleye Runtime
* Improved speed on runner change using native method to stop the wineserver when stalled
* Setting Windows version during bottle creation is now skipped when using Caffe
* Support for adding new programs using bottle-cli
* Programs are now stored with a unique ID, other ones will automatically be migrated on first launch
* A disclaimer is shown when setting Proton as runner
* Allow overriding cwd per program
* Allow overriding/using FSR per program
* Allow overriding PulseAudio latency per program
* Allow overriding/using a virtual desktop per program
* Cwd for programs with unix path is now automatically set to the executable root if not already defined
* New option to choose the language for the programs running inside the bottle
* Minor UI/UX improvements for better consistency
* FORCE_OFFLINE=1 can be used to force-launching Bottles in offline mode
* BOOT_TIME=1 can be used to benchmark Bottles' boot
* Repositories update status is now displayed during boot
* Programs overrides can now be reverted to the bottle's defaults using the dedicated option
* Gamescope settings are now hidden when the utility is not available, thanks to @TheEvilSkeleton
* Support for kgx terminal, thanks to @SuperSandro2000
* Improve terminal emulators priorities (easyterm, user-installed, desktop bundled, others), thanks to @jtojnar

### Fixes

* Fix missing icons when using custom themes
* Fix bottles location for non-flatpak packages
* Fix regression in DXVK-Nvapi for DLSS support
* Fix wrong window decoration layout, thanks to @nahuelwexd
* Fix for window freeze when menus are still open
* Fix runtime download, was trying to update the one bundled with Flatpak
* Fix desktop entry assistance dialog not showing up
* Fix not saving DLL Overrides
* Fix inconsistent runner choose when using the Custom environment
* Fix regression on bottle creation which was allowing mono and gecko dialogs
* Fix duplicate entries in installers view
* Fix not saving Environment Variables
* Fix path picker not showing for drives
* Fix regression in versioning, drive_c were not updated
* Fix Library not showing when a program is not found
* Fix regression in Steam launch options, were not properly parsed
* Fix for Gamescope when using MangoHud, thanks to @jntesteves
* Fix for dependencies removal, causing a crash when the entry was manually removed from the bottle configuration file

### Translations

* Ukrainian translations thanks to @Socially-disabled
* Thai translations thanks to @SashaPGT
* Croatian translations thanks to @milotype
* Malay translations thanks to Niskala Airaha
* Slovenian translations thanks to @Sporknife
* German translations thanks to @Arctize, @ThatRedKite, @Sematre
* Dutch translations thanks to @flipflop97
* Turkish translations thanks to @mucahitkurtlar
* Italian translations thanks to @musiclover382
* Finnish translations thanks to Jiri Grönroos
* Russian translations thanks to @Knebergish, Corvurius
* Catalan translations thanks to @rogervc
* French translations thanks to @renwe, J. Lavoie
* Lithuanian translations thanks to @TilloestTillo
* Hungarian translations thanks to @zoli111
* Bulgarian translations thanks to @RacerBG
* Serbian translations thanks to Andrija
* Spanish translations thanks to @fitjob
* Persian translations thanks to @retrhryhrth

## 2022.6.14-brescia-1 - 2022-06-15

_Release for AUR only._

### News

* fix empty bottles list


## 2022.6.14-brescia - 2022-06-13


### News

* Porting to GTK4 and libadwaita
* Support for override preferences per program
* New Onboard dialog
* New Bottle picker dialog when opening an executable with Bottles
* Shell support for bottles-cli
* Hi-res icons extraction
* List games from Steam for Windows when installed in a bottle
* Toast notifications
* Added 14 new Windows dependencies
* Installers uses fsync as default instead of esync
* Ability to disable Mouse Acceleration
* New register_dll action for dependencies (check the maintainers documentation)
* Improved performance and loading times
* Responsive UI
* Added version to Health Check

### Fixes

* Fix for paths with spaces in Steam shortcuts
* Fix importer not showing prefixes
* Fix for ignored patterns when looking for installed programs
* Fix for residues on bottle deletion
* Fix crash when listing a empty bottle
* Fix gamescope not working with launch options
* Fix for glitched icons
* Fix crash when opening a bottle if the runtime is not installed

### Translations

* Russian translations thanks to @Knebergish
* Bulgarian translations thanks to @RacerBG
* Finnish translations thanks to Jiri Grönroos
* Thai translations thanks to @SashaPGT
* Ukrainian translations thanks to @Socially-disabled
* Hungarian translations thanks to @zoli111
* Japanese translations thanks to @ryonakano
* Portuguese translations thanks to @frohlich
* Danish translations thanks to Ronja Parbst Sørensen
* Korean translations thanks to @yth1130
* Bengali translations thanks to @nazdridoy
* Chinese (Simplified) translations thanks to Eric
* Spanish translations thanks to @DeadKper, @goddrinksjava, @RandomVee, @Dansito
* Dutch translations thanks to @flipflop97
* Czech translations thanks to @vikdevelop
* Indonesian translations thanks to @Khayasen
* Portuguese (Brazil) translations thanks to @davipatricio
* French translations thanks to @julroy67
