# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.1.1
pkgrel=1
pkgdesc="Configurable restic wrapper"
arch=('any')
url="https://github.com/nils-werner/$pkgname"
license=('MIT')
depends=('python' 'restic')
source=("https://github.com/nils-werner/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('534994adccaf0f6639aad6a723a8508454ea1593e1540a63e5e53abea1b41b61')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
