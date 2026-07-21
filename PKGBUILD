# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A calendar for Omarchy"
arch=('x86_64')
url="https://github.com/t4t5/rencal"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libnotify')
provides=('rencal')
conflicts=('rencal')
options=('!debug' '!strip')
source=("rencal-$pkgver.deb::https://github.com/t4t5/rencal/releases/download/v$pkgver/renCal_${pkgver}_amd64.deb")
sha256sums=('14570f8d63b80197ebd3415dd9badd7c0be465f5be5d4dbb60ad414299412756')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
