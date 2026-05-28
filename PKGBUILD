# ena

pkgname=vocab
pkgver=0.19
pkgrel=1
pkgdesc="English/Turkish vocabulary tool"
arch=('any')
url="https://github.com/whyghost/vocab"
license=('MIT')
depends=('bash' 'sqlite' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e1de4498a43fedbaefd318f37bc78cf000f8d0476ec81cf07141203e5f1b4c2')

package() {
    cd "$pkgname-$pkgver"
    
    # calistirilabilir hale getirdim ve yetkisini veriyorum bebegim ver yetkiyi gör etkiyi
    install -Dm755 vocab "$pkgdir/usr/bin/vocab"
    
    #mit lisansı
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
