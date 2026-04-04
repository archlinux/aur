# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>

_pkgname=karousel
pkgname=kwin-karousel
pkgver=0.16
pkgrel=1
pkgdesc='KWin tiling script with scrolling'
arch=('any')
url='https://github.com/peterfajdiga/karousel/'
license=('GPL-3.0-or-later')
depends=('qt6-declarative' 'knotifications')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peterfajdiga/karousel/releases/download/v$pkgver/karousel_${pkgver//./_}.tar.gz")
sha256sums=('f9f326a9e4573f3ac3f24c9c7a0f059470f659902877033686b962bc93f2b3bb')

package() {
    install -dm755 "$pkgdir/usr/share/kwin/scripts/karousel"
cp -r "$_pkgname"/* "$pkgdir/usr/share/kwin/scripts/karousel/"
}
