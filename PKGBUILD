# Maintainer: Librewish <librewish@gmail.com>

pkgname=input-devices-support
pkgdesc="Metapkg for commonly used input devices such as fingerprint sensors or Wacom tablets"
pkgver=1.0.3
pkgrel=4
arch=('any')
url="https://wiki.archlinux.org/index.php/Category:Input_devices"
license=('GPL')
pkgdesc="Meta package for input devices support."
source=("libinput-gestures.desktop")
depends=("android-udev"
        "bolt"
        "brightnessctl"
        "fprintd"
        "iio-sensor-proxy"
        "linuxconsole"
        "lirc"
        "v4l-utils"
        "xdotool"
        "xf86-input-elographics"
        "xf86-input-evdev"
        "xf86-input-libinput"
        "xf86-input-void"
        "xf86-input-wacom")
optdepends=('piper: GTK application to configure gaming mice'
            'antimicrox: GUI for mapping keyboard keys to controller'
            'plasma-thunderbolt: Plasma integration for managing Thunderbolt devices'
            'libinput-gestures: Gesture support for non-Gnome DE'
            'touchegg: Default backend for the X11-Gestures Gnome extension'
            'game-devices-udev: Required for some gamepads to work. If your gamepad works without this package, dont install it!')        
            
replaces=('manjaro-input')
install=$pkgname.install
#package() {

  #install -d $pkgdir/etc/xdg/autostart
  #cp -rf $srcdir/libinput-gestures.desktop $pkgdir/etc/xdg/autostart
#}
sha256sums=('f3004dad807dda03d153828f2dfff7c65f69b308af26f2febac50a388d445def')
