# ena

pkgname=vocab
pkgver=0.22
pkgrel=1
pkgdesc="English/Turkish vocabulary tool"
arch=('any')
url="https://github.com/whyghost/vocab"
license=('MIT')
depends=('bash' 'sqlite' 'python')
source=("vocab::$url/raw/refs/tags/v$pkgver/vocab"
        "LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 vocab "$pkgdir/usr/bin/vocab"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
