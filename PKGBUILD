# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname=bukubrow
pkgname=bukubrow-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension, precompiled"
url="https://github.com/samhh/bukubrow-host/"
conflicts=('bukubrow')
arch=('x86_64')
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/bukubrow-linux-amd64")
sha256sums=('e6618e3b0ee9f2e11f5a6e94ce138327267e7f5807274ca053b40c9d01b9f6f3')

package() {
    install -Dm755 "$srcdir/bukubrow-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}

