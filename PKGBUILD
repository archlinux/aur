# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=finamp
pkgname=finamp-bin
pkgver=0.9.7_beta
pkgrel=1
pkgdesc="An open source Jellyfin music player"
arch=("x86_64")
url="https://github.com/jmshrv/finamp"
license=('MPL-2.0')
depends=('gtk3' 'pango')
provides=('finamp')
conflicts=('finamp')
source=("$url/releases/download/${pkgver//_/-}/finamp-${pkgver//_beta/}-linux-release-bundle.tar.gz")
sha256sums=('0698bf3aa326561f1dcdc85b11d0b3ab9f27fe930be367780dbc5d1ee2c00781')

package() {
    cd "$srcdir/bundle"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/$_pkgname/"
}
