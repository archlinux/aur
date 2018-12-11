# Maintainer: Matteljay <matteljay at pm dot me>
pkgname=labelpush
pkgver=2018.12.11
pkgrel=1
pkgdesc='Simple lightweight label printing app'
arch=('any')
url="https://github.com/Matteljay/$pkgname"
license=('MIT')
depends=('python-kivy' 'python-pillow' 'cups')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matteljay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7c2ac1ed8886a880035f489b8509b2554219b2c5e1f020f6b80ad976d3bbe952')

package() {
    cd $pkgname-$pkgver
    mkdir -vp $pkgdir/usr/bin/ $pkgdir/usr/share/
    cp -vf $pkgname.py $pkgdir/usr/bin/
    cp -vrf data/* $pkgdir/usr/share/
}

# End of file




