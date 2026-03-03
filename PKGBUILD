pkgname=ecliypse-bin
_pkgname=ecliypse
pkgver=2.1.0
pkgrel=1
pkgdesc="High-performance game downloader (CLI version)"
arch=('x86_64')
url="https://ecliypse.com"
license=('custom:commercial')

depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://s3.lillianne.solutions/aur/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d76e2a3e7825b44db57b542e52f9d0c93ae81c566278d5c8b032eb37aabcc3cf')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}