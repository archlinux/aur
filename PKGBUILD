# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname=bukubrow
pkgname=bukubrow-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension, precompiled"
url="https://github.com/samhh/bukubrow-host/"
provides=('bukubrow')
arch=('x86_64')
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/bukubrow-linux-amd64")
sha256sums=('132cf1c40da9f5dee6dcd3bae1ff9586add4275a64d87be4843c2c385b30bcac')

package() {
    install -Dm755 "$srcdir/bukubrow-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}

