# Maintainer: Librewish <librewish@gmail.com>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=pipewire-support
pkgver=1
pkgrel=16

arch=('any')
url="https://wiki.archlinux.org/index.php/PipeWire"
license=('GPL')
pkgdesc="Meta package for all important packages to use PipeWire"
depends=("gst-plugin-pipewire"
        "pipewire"
        "libpipewire"
        "pipewire-alsa"
        "pipewire-jack"
        "pipewire-pulse"
        "pipewire-v4l2"
        "pipewire-x11-bell"
        "pipewire-zeroconf"
        "realtime-privileges"
        "sof-firmware"
        "wireplumber")
conflicts=("pulseaudio-equalizer"
        "pulseaudio-jack"
        "pulseaudio-lirc"
        "pulseaudio-rtp"
        "pulseaudio-support"
        "pulseaudio-zeroconf"
        "jack2"
        "jack2-dbus"
        "lib32-jack2"
        "manjaro-pulse")
replaces=("manjaro-pipewire")
install=$pkgname.install
