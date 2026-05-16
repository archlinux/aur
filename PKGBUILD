# Maintainer: wypifu <lilington80@gmail.com>
pkgname=auro
pkgver=0.6
pkgrel=1
pkgdesc="Simple AUR package manager with PKGBUILD review and dependency resolution"
arch=('any')
url="https://github.com/wypifu/auro"
license=('MIT')
depends=('python' 'python-requests' 'python-tomli-w')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wypifu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('17665ee20f29cd4b8d3d2998cbb2055b4c3395a85ff2724f7109205871f176c1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 auro.py "$pkgdir/usr/bin/auro"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
