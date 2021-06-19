# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=anbox-support
pkgver=1.0.3
pkgrel=2
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/settings/$pkgname"
license=('GPL')
makedepends=('coreutils')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')
pkgdesc='Metapkg with for Anbox & needed configs'
depends=(anbox-git android-tools)
install=$pkgname.install

package() {
    install -d $pkgdir/usr
    cp -rf $srcdir/$pkgname-$pkgver/usr $pkgdir
}


