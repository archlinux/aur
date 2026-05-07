# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.0.5
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
sha256sums=('2501f735d3ddc5e1735601aec44c022b43e1bb4aa3283da64c619140ab333c59')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
