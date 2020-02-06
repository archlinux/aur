# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.2.0
pkgrel=1
pkgdesc="Configurable restic wrapper"
arch=('any')
url="https://github.com/nils-werner/$pkgname"
license=('MIT')
depends=('python' 'restic')
source=("https://github.com/nils-werner/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1f8475dc040dbda93f4317277a799db1d6097e064032ff27911eecf4f9e28905')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname.py -t $pkgdir/usr/bin/$pkgname
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
