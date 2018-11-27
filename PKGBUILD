# Maintainer: Matteljay <matteljay at pm dot me>
pkgname=labelpush
pkgver=2018.11.27
pkgrel=1
pkgdesc='Simple lightweight label printing app'
arch=('any')
url="https://github.com/Matteljay/$pkgname"
license=('MIT')
depends=('python-kivy' 'python-pillow' 'cups')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matteljay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8db86374490d002ee7934e7cae10c0be8d8327a53b8c3a05cfcaf2294bf7c6e9')

package() {
    cd $pkgname-$pkgver
    mkdir -vp $pkgdir/usr/bin/ $pkgdir/usr/share/
    cp -vf $pkgname.py $pkgdir/usr/bin/
    cp -vrf data/* $pkgdir/usr/share/
}

# End of file




