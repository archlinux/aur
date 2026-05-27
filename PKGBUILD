# ena

pkgname=vocab
pkgver=0.7
pkgrel=1
pkgdesc="English/Turkish vocabulary tool"
arch=('any')
url="https://github.com/whyghost/vocab"
license=('MIT')
depends=('bash' 'sqlite' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ade0a403537fcce8f2278bf4ffb42847485844072d33f40730f6f69ad002965')

package() {
    cd "$pkgname-$pkgver"
    
    # calistirilabilir hale getirdim ve yetkisini veriyorum bebegim ver yetkiyi gör etkiyi
    install -Dm755 vocab "$pkgdir/usr/bin/vocab"
    
    #mit lisansı
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
