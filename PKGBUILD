pkgname=pitone
pkgver=1.2.0
pkgrel=1
pkgdesc="An italian programming language based on python. Smile, it's amazing!"
arch=('any')
url="https://github.com/Matxe24/Pitone"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matxe24/Pitone/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/Pitone-main"

    # Installa la shell interattiva come 'pitone'
    install -Dm755 shell/linux/pitone "$pkgdir/usr/bin/pitone"

    # Installa il compilatore come 'pitonec'
    install -Dm755 compilator/linux/pitone "$pkgdir/usr/bin/pitonec"

    # Licenza
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
