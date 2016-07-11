# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname=xdgurl
pkgver=1.0.0
pkgrel=1
pkgdesc="An install helper program for desktop stuff."
arch=('any')
url="https://github.com/xdgurl/xdgurl"
license=('GPL3')
depends=('tk')
source=("$url/archive/release-$pkgver.tar.gz")
md5sums=('b5a4ee26888696153dc35b434adc312c')

package() {
    cd "$pkgname-release-$pkgver"

    install -D -m 755 "src/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 "src/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
