# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
# Contributor: Heddxh <g311571057 at gmail dot com>

_pkgname=karousel
pkgname=kwin-karousel
pkgver=0.17
pkgrel=1
pkgdesc='KWin tiling script with scrolling'
arch=('any')
url='https://github.com/peterfajdiga/karousel/'
license=('GPL-3.0-or-later')
depends=('qt6-declarative' 'knotifications')
install=kwin-karousel.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peterfajdiga/karousel/releases/download/v$pkgver/karousel_${pkgver//./_}.tar.gz")
sha256sums=('492e2962dc0e510e4779a0eedfc2aa311c2ee3e4b6621648eae60edbe30bd1c3')

package() {
    install -dm755 "$pkgdir/usr/share/kwin/scripts/karousel"
cp -r "$_pkgname"/* "$pkgdir/usr/share/kwin/scripts/karousel/"
}
