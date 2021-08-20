# Maintainer: Sick Codes <info at sick dot codes>
pkgname=usbfluxd
pkgver=2.2.0
pkgrel=1
pkgdesc="Redirects the standard usbmuxd socket to allow connections to local and remote usbmuxd instances so remote devices appear connected locally."
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/corellium/usbfluxd"
license=('GPL2')
provides=(${pkgname})
depends=()
optdepends=()
makedepends=()
source=("${pkgname}-${arch}-${pkgver}-libc6-libdbus13.tar.gz::https://github.com/corellium/usbfluxd/releases/download/v1.0/${pkgname}-${arch}-libc6-libdbus13.tar.gz")
sha256sums=('de052a0e14e39a6d53d5aa0291c2c979f6a02b325257088cd35ca4458c9d4f10')

package() {
  cd "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}-${arch}-libc6-libdbus13/usbfluxd" "${pkgdir}/usr/bin/usbfluxd"
  install -Dm755 "${srcdir}/${pkgname}-${arch}-libc6-libdbus13/usbfluxctl" "${pkgdir}/usr/bin/usbfluxctl"
}


