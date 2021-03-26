# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname=bukubrow
pkgname=bukubrow-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Host application for the Bukubrow WebExtension, precompiled"
url="https://github.com/samhh/bukubrow-host/"
conflicts=('bukubrow')
arch=('x86_64')
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/bukubrow-linux-amd64")
sha256sums=('dee9c73dae36f62b82b0b073ea2f69acc91249345842156d6f2ee0a15b97f247')

package() {
    install -Dm755 "$srcdir/bukubrow-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}

