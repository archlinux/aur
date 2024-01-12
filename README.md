Photonvision AUR Package

PhotonVision is the free, fast, and easy-to-use computer vision solution for the FIRST Robotics Competition.https://photonvision.org/

# Updating this package

With some commands borrowed from https://madskjeldgaard.dk/posts/aur-package-workflow/

On a test system, clone the AUR so that we can edit it
```
git clone https://aur.archlinux.org/photonvision-bin.git
cd photonvision-bin
```

Make changes and try to install
```
makepkg -si
```

Update package metadata
```
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

And commit + push the update!

