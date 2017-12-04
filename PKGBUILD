pkgname=helper-debug
pkgver=1
pkgrel=7
pkgdesc="Helper debug test"
arch=('any')
url="https://www.google.com/chrome"
license=('custom')
source=("$url/eula_text.html")
md5sums=('7668b7610dc13f42cd928079beba0eb7')

package() {
    install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/$pkgname/eula_text.html
}

