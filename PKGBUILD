# Maintainer: Funami
pkgname=htmlq-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Like jq, but for HTML"
arch=('x86_64')
url="https://github.com/mgdm/htmlq"
license=('MIT')
provides=('htmlq')
conflicts=('htmlq')
source=("https://github.com/mgdm/htmlq/releases/download/v$pkgver/htmlq-x86_64-linux.tar.gz"
        "https://raw.githubusercontent.com/mgdm/htmlq/v$pkgver/LICENSE.md")
sha256sums=('4f63c8d9d835aa1f18f472da2eb5fc88295ede6aebcc7949fd428403707fc74a'
            'd456ecab8c75cb216100cf7eddb0d6c672e123884745a4ce8d4962496c2f904f')

package() {
  install -Dm755 htmlq -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/htmlq"
}
