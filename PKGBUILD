# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
# Contributor: Heddxh <g311571057 at gmail dot com>

_pkgname=karousel
pkgname=kwin-karousel
pkgver=0.18
pkgrel=1
pkgdesc='KWin tiling script with scrolling'
arch=('any')
url='https://github.com/peterfajdiga/karousel/'
license=('GPL-3.0-or-later')
depends=('qt6-declarative' 'knotifications')
install=kwin-karousel.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peterfajdiga/karousel/releases/download/v$pkgver/karousel_${pkgver//./_}.tar.gz")
sha256sums=('c70270eb09d01723ca10e380a92d28f9fbc5513623c344ce304519d828cd441f')

package() {
    install -dm755 "$pkgdir/usr/share/kwin/scripts/karousel"
    cp -r "$_pkgname"/* "$pkgdir/usr/share/kwin/scripts/karousel/"
}
