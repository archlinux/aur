# ena

pkgname=vocab
pkgver=0.11
pkgrel=1
pkgdesc="English/Turkish vocabulary tool"
arch=('any')
url="https://github.com/whyghost/vocab"
license=('MIT')
depends=('bash' 'sqlite' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e99d9723101c727233bd3c3703d01addb57cbc05ae54fab634d5deb994348f44')

package() {
    cd "$pkgname-$pkgver"
    
    # calistirilabilir hale getirdim ve yetkisini veriyorum bebegim ver yetkiyi gör etkiyi
    install -Dm755 vocab "$pkgdir/usr/bin/vocab"
    
    #mit lisansı
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
