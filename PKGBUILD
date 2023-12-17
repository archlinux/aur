#Maintainer: mario0fan (przemyslawlasek98@gmail.com)
pkgname=randsay
pkgver=1.0
pkgrel=1
pkgdesc="Generates a random quote, and makes a random cowfile say it."
arch=('any')
url="https://github.com/mario0fan-cooldude/randsay"
license=('GPL')
depends=('python' 'cowsay' 'fortune-mod')

source=("randsay.py::https://raw.githubusercontent.com/mario0fan-cooldude/randsay/main/randsay.py")

sha256sums=('295ca489c0e8fbfb35f3fe34372509ec7b43e32da1aafebb6f32fc93ed0d702b')

noextract=("$pkgname-$pkgver")

package() {
  install -Dm755 "$srcdir/randsay.py" "$pkgdir/usr/bin/randsay"
}
