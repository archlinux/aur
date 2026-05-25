# ena

pkgname=vocab
pkgver=0.4
pkgrel=1
pkgdesc="English/Turkish vocabulary tool"
arch=('any')
url="https://github.com/whyghost/vocab"
license=('MIT')
depends=('bash' 'sqlite' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('360f0ec8c171e4639a63d9a0bf84ebcea2bd2361d73ef54613d39be67c475e98')

package() {
    cd "$pkgname-$pkgver"
    
    # calistirilabilir hale getirdim ve yetkisini veriyorum bebegim ver yetkiyi gör etkiyi
    install -Dm755 vocab "$pkgdir/usr/bin/vocab"
    
    #mit lisansı
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
