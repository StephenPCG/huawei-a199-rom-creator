Discussion and support thread can be found on XDA-Developers here:
http://forum.xda-developers.com/showthread.php?t=1538053

Download:
http://download.chainfire.eu/351/SuperSU/UPDATE-SuperSU-v1.65.zip

Version:
1.65

Changelog:
10.09.2013 - v1.65
- Brought back ARMv5 compatibility
- Fixed compatibility issues with Android 2.x
- Updated language files
- ZIP: combined ARM+x86 support

05.09.2013 - v1.60
- Added SELinux+Enforcing compatibility (for new SGS4 ROMs)
- Fixed (newest) CWM versions asking you question that break root if answered wrongly
- Fixed issue with the TWRP/CWM binary installer 
- Fixed 4.3 OTA survival looping

31.08.2013 - v1.55
- 4.3: Reworked OTA survival - should work properly now, and no longer causes OTA errors (also: +i removed from install-recovery) 
- Daemon: client ENV is now provided to su'd calls 
- Updated language files

29.07.2013 - v1.51
- Some 4.3 time-handling code caused problems on < 4.3 devices, making some root apps stop working

29.07.2013 - v1.50
- Daemon: proper storage mounts
- Daemon: per-uid mount namespace
- Daemon: another exitcode issue fix
- Daemon: adjusted reload code
- Daemon: descriptive process names 
- GUI: added reboot advisory after binary update
- ARCH: Only ARMv7 and X86 are now supported, ARMv5 dropped
- ZIP: install also to install-recovery.sh and init.d

27.07.2013 - v1.45
- Daemon: fixed exitcode not always being passed from child shell to calling process
- Daemon: fixed possible credential check bypass
- GUI: now also updates install-recovery.sh

25.07.2013 - v1.43
- Daemon: code/security mini-audit by Joshua J. Drake
- Daemon: cwd is now respected
- Daemon: auto-daemon feature
- Deamon: fixed cpu spike issue
- Daemon: symlinks sdcard (temporary) 
- TWRP-based update: fixed script error
- GUI: Added 4.3 update notice
- GUI: Removed full content logging global warning 
- Updated language files

04.07.2013 - v1.41
- Fixed issue with TiBu in daemon mode
- Updated language files

03.07.2013 - v1.39
- Fixed full content logging with terminal apps
- Logs now use monospace fonts
- Added daemon mode for hard-to-root firmwares

15.06.2013 - v1.34
- Fixed various problems when accessibility options are enabled
- Fixed NPE in log screen
- Updated language files

07.06.2013 - v1.32
- Fixed bug in detection ACCESS_SUPERUSER permission
- Updated language files

21.05.2013 - v1.30
- Updated binary to work on some newer Samsung firmwares
- Nagging has done its job for now - disabled again
- Added backup script and CWM SU files to full unroot file removal
- Added option to remove other superuser apps
- Updated languages files

03.03.2013 - v1.25
- Fixed permission display on Play
- Fixed crash on open and immediate close
- Ask again time choice is now remembered per-app
- Updated language files

28.02.2013 - v1.20
- Added basic tablet theme
- New prompt activity for >= API 14 (Android 4.0)
- Changed default theme+icon to light+emblem (you can change it back in settings, if you want)
- Fixed custom dialog box themes in light+darkactionbar theme
- Fixed issues with the light theme
- Various minor modifications to UI
- Several security improvements
- Added TWRP/CWM binary installer
- android.permission.ACCESS_SUPERUSER - detection and display (disabled by default, see settings)
- Fixed process name detection issue
- Freeloader option (I'm not sure this is staying, so enjoy it while you can)
- Internal refactoring
- Updated language files

23.02.2013 - v1.10
- Added support for x86 devices
- Added basic multi-user support
- Language files updated

20.02.2013 - v1.05
- Fixed possible issue with OTA survival
- Fixed su binary notification freeze issue when suid bit lost
- Fixed background root command freeze when suid bit lost 
- Improved su binary version and root presence detection
- Added cleanup stage (detected when needed) before converting to system app, to prevent settings loss
- Language files updated 

02.01.2013 - v1.04
- PIN code now survives uninstalling Pro (vuln. fix)
- Fixed pm freeze in logs/settings (USB debugging)
- Fixed various util freezes (convert to system, uninstall) (USB debugging)
- Fixed minor UI text issues
- Language files updated

31.01.2013 - v1.03
- Fixed pm crash in logs/settings
- Reduce nag frequencey to 10%
- Add NoNag APK
- Language files updated

30.01.2013 - v1.02 - NOTES ON DUMPSTATE (click)
- Fixed (another) crash on icon change on Android versions older than 4.0.3
- Launch SuperSU through secret codes: *#*#1234#*#* and *#*#7873778#*#* (*#*#SUPERSU#*#*). Not all phones take both codes. On some phones you need to use single *# instead of double *#*#
- Update su binary parameter parsing to add Google-naive style params
- Dumpstate blacklist
- Language files updated

29.01.2013 - v1.01
- Fixed crash on icon change on Android versions older than 4.0.3
- Adjusted (un)installer code to remove .odex files and remove dalvik caches
- Adjust default icon in manifest 
- Dumpstate no longer goes into infinite loop (dumpstate shouldn't kill phone anymore, but this has not fixed dumpstate being triggered - workaround !)
- Language files updated
- Adjusted update ZIP to remove .odex files, overwrite OTA survival binary, remove dalvik caches

28.01.2013 - v1.00 - RELEASE NOTES (click)
- Icon now selectable from 5 options, or hide completely from launcher (see note)
- Theme now selectable from 4 options
- (Pro) Added option to grant/deny with a timer (hold grant/deny button in popup for two seconds)
- Added option to convert to system app
- Added option to trust system user without confirmation
- (Pro) Added option to adjust auto-deny countdown
- (Pro) Added option to PIN protect on a per-app base
- Added option to auto-refresh apps/logs tab
- Fixed "ask again" being forgotten
- CyanogenMod: Added to option to respect/ignore DevOptions --> Root Access setting
- CyanogenMod: Added option to install addon backup script (survive update flashes)
- Fixed 7" tablets now use (improved) large PIN panel
- Free space detection issue work-around (may fix a number of binary installation failures)
- Alternate remount method (may fix binary installation issues on Android 2.x)
- Updated su binary parameter parsing
- Updated su binary to add user-related environment variables
- Adjusted cleanup and copyright texts
- Fixed autoclose upon cleanup complete
- Faster preference text loading
- Faster settings tab fragment instantiation
- Reworked native debug logging
- Reworked shell detection, now includes /system/bin/mksh fallback
- Adjustments that may reduce problems for S-ON users
- Added nag message to non-Pro (with option to disable)
- Language files updated
...
* to start hidden SuperSU from ADB shell with root rights: am start -a android.intent.action.MAIN -n eu.chainfire.supersu/.MainActivity

04.12.2012 - v0.99
- More Android 4.2 related fixes
- Disabled text correction on labels
- Updated languages

14.11.2012 - v0.98
Quote:
Preliminary update for Android 4.2's multi-user capabilities. 
Only the main user can run the UI and gain root access. 
Secondary user's apps will not be granted root, nor can 
those users change SuperSU configuration.

This is all temporary. Proper multi-user support is being 
worked on.

Note that if a non-user process (like ADB shell) needs to 
prompt for root, that prompt will always appear on the 
MAIN user's screen !
29.10.2012 - v0.97
- Fixed issue with modified AOSP su binary
- Fixed wrong translation crashing app on toast
- Fixed possible exploit (preventive)
- Modified system and shell user - no longer granted root by default
- Added "ADB shell" display
- Added warning to selecting full content logging
- Added method for apps to disable (by default only) full content logging if known to be problematic (<meta-data android:name="eu.chainfire.supersu.meta.contentlog ging.problematic" android:value="true" />, see How-To SU)
- Updated languages

29.08.2012 - v0.96
- Fixed occasional issue with OTA
- Fixed possible exploit (preventive)

22.08.2012 - v0.95
- Fixed action bar icon sizes
- Fixed a few JellyBean-related issues
- Added automatic binary updated during boot if needed and possible
- New logo/icons
- Updated languages

16.07.2012 - v0.94
- Fixed possible NPE crash at startup
- Fixed possible ANR freeze at boot
- Fixed possible ANR freeze at package removal
- Fixed crash with too many logfiles (auto-empties logs!)
- Updated various internal functions to be async
- Updated chattr version (fixes some instances of root loss)
- Added "clear logs" action to actionbar in logs tab
- Updated languages

03.07.2012 - v0.93
- Fixed a possible delay issue (receiver deadlock)
- Updated languages

21.06.2012 - v0.92
- Fixed app detail spinners becoming invisible
- Fixed app detail button layout (diff. for port/land)
- Fixed log detail crash at rotate
- Fixed language override stick at display rotation
- Fixed display of languages without countries in override
- Fixed potential low space installation issue
- Fixed icon rearrange issue (except when low on space)
- Updated languages

18.06.2012 - v0.91
- Fixed root permission check (OTA survival)
- Fixed a number of possible installation failures
- Fixed language detection crash issue
- Added multilanguage support (27 languages and counting)

11.06.2012 - v0.90
- Fixed various texts
- Fixed various crash issues
- Fixed various non-response issues
- Fixed possible security issue 
- PIN code now requires verification before changing
- Added title and navigation to log detail activity

07.05.2012 - v0.89
- Fixed stay-on-top issue
- Fixed possible exploit
- Improved security

23.04.2012 - v0.88
- Fixed a number of performance issues
- Added re-authentication option
- Apps now sorted alphabetically
- Voodoo OTA Root Keeper backup removed at binary install

26.03.2012 - v0.87
- Fixed an issue with several apps re-requesting root
- Fixed a number of reported crashes
- Fixed a few ANRs

26.03.2012 - v0.86
- Fixed a cleanup issue

26.03.2012 - v0.85
- Fixed issue if root is disabled during update

25.03.2012 - v0.84
- Modified OTA survival behavior - re-enable this setting if needed !
- Modified SH search order
- Modified backup shell location
- Added cleanup for reinstallation option
- Added cleanup for switching superuser app option
- Added cleanup for full unroot option
- If the APK is not installed, root is always granted

17.03.2012 - v0.83
- Fix command not visible
- Fix zombie process freeze
- Fix zombie process cleanup
- Fix -c followed by multiple parameters
- Fix high cpu load issue
- Fix STDIN closed relay
- Fix log display bug
- Fix swipe empty tabs
- Improved swipe behavior
- Added app title
- Added refresh button

14.03.2012 - v0.80
- Reversed swipe direction
- Adjusted touch response
- Adjusted request queueing
- Adjusted time counter
- Non-prompt notifications now async
- Permissions auto-removed if an app is uninstalled

12.03.2012 - v0.78
- Adjusted prompt-on-boot behavior
- Adjusted request serialization
- Added swiping between tabs
- Fixed force user setting
- Pro: fixed faulty SuperSU restored message 

10.03.2012 - v0.75
- Adjustment to OTA survival (better!)
- Slight speedup in Settings
- Fixed native settings update after temp-re-root
- Clear data no longer clears PIN code
- Layout: Prompt: Grant and Deny switch positions (ICS style) 
- Layout: AppDetail: Save and Cancel switched positions (ICS style)
- Layout: Added xlarge PIN layout

10.03.2012 - v0.74
- Proper command escaping
- Fixed inifinite loop
- Fixed notification broadcast (should fix all freezing issues)

09.03.2012 - v0.73
- Fixed su binary detection problem
- Fixed two FC's in settings
- Disabled some debug stuff that was left enabled in v0.72

09.03.2012 - v0.72
- Minor adjustments to install script
- Fixed issue with really old SU version detection

09.03.2012 - v0.71
- Fix permission problem due to faulty installation
- Added error message if device is not yet rooted
- Cancelling binary update now closes app

09.03.2012 - v0.70
- Initial public release
