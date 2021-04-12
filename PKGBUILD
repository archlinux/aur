# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=set-unicoderange
pkgver=0.1.0
pkgrel=1
pkgdesc='automatically set OpenType OS/2 table Unicode range bit flags in fonts '
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('Apache')
depends=('python' 'python-fonttools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('330cc50d36558b86f685a6f3fbea1b3d31990bf06bb7c9e5ad9fadf64d649bd1')

package() {
    cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/$pkgname" "src/$pkgname.py"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
