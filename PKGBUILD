pkgname=helper-debug
pkgver=1
pkgrel=6
pkgdesc="Helper debug test"
arch=('any')
url="https://www.google.com/chrome"
license=('custom')
source=("$url/eula_text.html")
md5sums=('d50d8f0a6940791eabc41c4f64e6a3cf')

package() {
    install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/$pkgname/eula_text.html
}

