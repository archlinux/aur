# Maintainer: sodahub-org <https://github.com/sodahub-org/sodam>
pkgname=sodam-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Native Qishui Music desktop client built with GPUI (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/sodahub-org/sodam'
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb')
provides=('sodam')
conflicts=('sodam')
options=('!strip' '!debug')
source_x86_64=("https://github.com/sodahub-org/sodam/releases/download/v0.4.0/sodam-0.4.0-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/sodahub-org/sodam/releases/download/v0.4.0/sodam-0.4.0-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('90c97e7b00e7364453786d41d260098f431db4683969d5362ad7138f9135dc85')
sha256sums_aarch64=('238eb6cd59b34a67214fe7548283cc1935d344144bccf6500c945a35a43cb612')

package() {
  bsdtar -xf "$srcdir/sodam-${pkgver}-1-${CARCH}.pkg.tar.zst" -C "$pkgdir" usr
}
