# Maintainer: Mikhail Velichko <efklid at gmail dot com>
# Contributor: Librewish <librewish@gmail.com>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=input-devices-support
pkgver=1.0.7
pkgrel=3
arch=('any')
url="https://wiki.archlinux.org/index.php/Category:Input_devices"
license=('GPL')
pkgdesc="Metapkg for commonly used input devices such as fingerprint sensors or Wacom tablets"

depends=('android-udev'
        'bolt'
        'brightnessctl'
        'fprintd'
        'game-devices-udev'
        'iio-sensor-proxy'
        'linuxconsole'
        'lirc'
        'libinput-gestures'
        'v4l-utils'
        'xdotool'
        'ydotool'
        'xf86-input-elographics'
        'xf86-input-evdev'
        'xf86-input-libinput'
        'xf86-input-void'
        'xf86-input-wacom'
        )
conflicts=('touchegg' 'input-devices-support-gnome')

replaces=('manjaro-input')

optdepends=('piper: GTK application to configure gaming mice'
            'antimicrox: GUI for mapping keyboard keys to controller'
            'plasma-thunderbolt: Plasma integration for managing Thunderbolt devices'
            'gestures: GUI to configure libinput-gestures'
            'solaar: Device manager for Logitech Unifying receiver peripherals, most Lightspeed supports too'
            'openrazer-meta: Support for Razer gaming peripherals')

install=$pkgname.install

