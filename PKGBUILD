# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>
# Contributor: XONIDU <xonidu@gmail.com>

pkgname=xonispam
pkgver=1.0.0
pkgrel=1
pkgdesc="Herramienta educativa de automatización de teclado para pruebas de spam"
arch=('any')
url="https://github.com/XONIDU/xonispam"
license=('MIT')
depends=('python' 'python-pyautogui')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/xonispam/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    install -Dm755 start.py "$pkgdir/usr/bin/$pkgname"
    install -Dm644 xonispam.py "$pkgdir/usr/share/$pkgname/xonispam.py"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
