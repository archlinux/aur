pkgname=helper-debug
pkgver=1
pkgrel=5
pkgdesc="Helper debug test"
arch=('any')
url="https://www.google.com/chrome"
license=('custom')
source=("https://www.google.com/chrome/browser/privacy/eula_text.html")
md5sums=('SKIP')

package() {
    install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/$pkgname/eula_text.html
}

