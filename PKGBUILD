# Maintainer: Francisco Giordano <fg@frang.io>

pkgname=volta-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="JavaScript Launcher"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux.tar.gz"
        "https://raw.githubusercontent.com/volta-cli/volta/v$pkgver/LICENSE")
md5sums=('6ea2213570eca7218668c5bf86890ba5'
         'a8a025d12adc6bd305a7402166baefef')

package() {
        install -Dm755 -t "$pkgdir/usr/bin" volta volta-shim volta-migrate
        install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: et sw=8 ft=PKGBUILD
