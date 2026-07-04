# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.4.2
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
sha256sums=('6a05a45f4416b2d2f2da288ffecf4c45d66b3bf8b0a083bfc1f3a3018893d8f2')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
