# ena

pkgname=vocab
pkgver=0.7
pkgrel=3
pkgdesc="English/Turkish vocabulary tool"
arch=('any')
url="https://github.com/whyghost/vocab"
license=('MIT')
depends=('bash' 'sqlite' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27cc0dd908d826e5447257e7af269f4c55133e04e3f8356b36ae5d8ef6c9320a')

package() {
    cd "$pkgname-$pkgver"
    
    # calistirilabilir hale getirdim ve yetkisini veriyorum bebegim ver yetkiyi gör etkiyi
    install -Dm755 vocab "$pkgdir/usr/bin/vocab"
    
    #mit lisansı
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
