# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: JcNils <jcnils at user dot noreply dot github dot com >
# Contributor: Xaryphon <xaryphon at tuta dot io>
pkgname=protonhax
pkgver=1.0.5
pkgrel=4
pkgdesc="Program to help executing outside programs in proton"
arch=('any')
url="https://github.com/jcnils/protonhax"
license=('BSD-3-Clause')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/jcnils/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3da772c947309f33be7b613c1cb9232c3477ae44fb1c581ffa96cb6508496ba4')

package() {
    depends=('bash')
    cd $pkgname-$pkgver

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -d -m755 $pkgdir/usr/bin
    install -m755 protonhax $pkgdir/usr/bin/protonhax
}
