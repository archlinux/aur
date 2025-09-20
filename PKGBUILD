# Maintainer: Jesse Limerick <iontunnel@proton.me>
pkgname=pnmixer-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A lightweight modular system tray volume mixer for ALSA/Pulseaudio/Pipewire (binary)"
arch=('x86_64')
url="https://github.com/nicklan/pnmixer"
license=('GPL')
depends=('alsa-utils' 'gtk3' 'libnotify')
provides=('pnmixer')
conflicts=('pnmixer')
source=("pnmixer-bin-0.7.2.tar.gz")
sha256sums=('SKIP')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
