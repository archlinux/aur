# Arch-Wireframe for Plymouth

This is a Plymouth theme built using jcklpe's Plymouth Animated Boot Screen Creator. I adapted an original render by /u/RedPanda_UA to make a
high resolution splash screen (1920x1080). It runs at 15fps due to file restraints in Plymouth, but the theme itself is much larger than 
a static splash screen. The original animation was 2 seconds and ran at 60fps, so the theme would have been like 120MB if I didn't cut any frames. Either way, it runs perfectly on my low-end laptop, so I hope that it works for you too. The frames located in /arch-wireframe/animation also make for dank wallpapers, although /u/RedPanda_UA has uploaded 4k versions without mp4 artifacts.

## Installation

Since this is a theme for Arch, I assume that you're using it. If you're on another distro and want to pretend like you installed Arch,
keep in mind that Plymouth has a dependency on some other distros called 

```
plymouth-themes
```

that is required to customize your splash screen. 

### First things first:

Install Plymouth from the AUR:

```
yay -S plymouth
```

Read the wiki for more information on Plymouth configuration:
https://wiki.archlinux.org/index.php/plymouth

## Installing the theme:

1. Go to your plymouth themes folder:

```
cd /usr/share/plymouth/themes
```

2. Clone this repo!

```
git clone https://github.com/dreamsmasher/Arch-Wireframe-Plymouth-Theme arch-wireframe
```

3. Set arch-wireframe as your default theme:

```
sudo plymouth-set-default-theme -R arch-wireframe
```

This will regenerate your initramfs in the process.

4. Reboot, sit back, and enjoy the //V I B E S//


# Credits
Original repo by Eionix: https://github.com/krishnan793/PlymouthTheme-Cat/commits?author=krishnan793

Theme creator made by jcklpe: https://github.com/jcklpe/Plymouth-Animated-Boot-Screen-Creator

Art by RedPanda_UA: https://drive.google.com/drive/folders/1JPzp3ptSdtVcw5ztvMheGOxWaOjIVtZO
		https://www.youtube.com/user/MasterKEnnY2009/featured

Theme by dreamsmasher: https://github.com/dreamsmasher
1366x768 version: https://github.com/dreamsmasher/arch-wireframe-plymouth-theme-1366 
Please let me know if you have any theme requests, I'm pretty adept in Photoshop/GIMP and would love to contribute more to the Arch/FOSS community.
Half of the theme packages on pling don't even work, so I'm gonna do my best to make and maintain aesthetic themes for your enjoyment.
