# Maintainer: Łukasz Moroz <lukaszmoroz@gmail.com>

pkgname=nautilus-copy-path
pkgver=1.2.3
pkgrel=2
pkgdesc="Extension for Nautilus to copy files/dir path or name"
arch=('any')
url="https://github.com/chr314/nautilus-copy-path"
license=('MIT')
depends=('python-nautilus' 'python-gobject')
install=nautilus-copy-path.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chr314/nautilus-copy-path/archive/$pkgver.tar.gz")
md5sums=('e05e630b73b9c7c246e42eee9a852aae')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/licenses/nautilus-copy-path" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" nautilus-copy-path.py
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions/nautilus-copy-path" nautilus_copy_path.py translation.py
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions/nautilus-copy-path/translations" translations/*.json
}
