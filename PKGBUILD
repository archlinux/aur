# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>
pkgname=xonichat
pkgver=4.2.0
pkgrel=1
pkgdesc="A terminal-based Gemini client optimized for low-resource devices (ASUS Eee PC, etc.)"
arch=('any')
url="https://github.com/XONIDU/xonichat"
license=('MIT')
depends=('python' 'python-requests')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/xonichat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Instalar start.py como ejecutable principal
  install -Dm755 start.py "$pkgdir/usr/bin/xonichat"
  
  # Instalar xonichat.py en /usr/share/xonichat/
  install -Dm755 xonichat.py "$pkgdir/usr/share/xonichat/xonichat.py"
  
  # Instalar documentación
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 requirements.txt "$pkgdir/usr/share/doc/$pkgname/requirements.txt"
}
sha256sums=('aa3e9f5f71386f277a1a533c95039332a0415dd57d12b21ee87733703309fd49')
sha256sums=('aa3e9f5f71386f277a1a533c95039332a0415dd57d12b21ee87733703309fd49')
sha256sums=('aa3e9f5f71386f277a1a533c95039332a0415dd57d12b21ee87733703309fd49')
