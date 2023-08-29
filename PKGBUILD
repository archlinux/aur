pkgname=btattach
pkgver=1
pkgrel=1
pkgdesc="Automatically spawn btattach for UART bluetooth adapters"
url="https://github.com/TarlogicSecurity/Bluetooth-Attach-Service"
arch=('any')
makedepends=('make')
source=("${pkgname}::git+$url")
sha256sums=('SKIP')

package() {
    cd "${pkgname}"
    make DESTDIR=${pkgdir} install
}
