# Maintainer: Meow King <mr.meowking@anche.no>
pkgname=cyber
pkgver=0.3 # NOTE
pkgrel=1 # NOTE
pkgdesc="Fast and concurrent scripting. "
arch=("x86_64")
url="https://github.com/fubark/cyber"
license=('MIT')
provides=("cyber" "cyberscript") 
conflicts=("cyber" "cyberscript")
changelog="changelog.txt" # NOTE
source=("${url}/releases/download/${pkgver}/cyber-linux-x64.tar.gz")
sha256sums=('24343c64e6c249fc2c081d11d959ad0e1db612f534e0a891c96db6111d9a3e1d')

package() {
    install -Dm755 cyber ${pkgdir}/usr/bin/cyber
}
