# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=0.2.9
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64')
url='https://istio.io'
license=('Apache')
depends=('glibc')
optdepends=()
makedepends=()
conflicts=("${_pkgname}")

source=("https://github.com/istio/istio/releases/download/${pkgver}/istio-${pkgver}-linux.tar.gz")
sha256sums=('d87f89d68549471e2fbd0492e3bd24c2ad7e71778939bcb4c069a9bd77617f90')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$(find bin -type f)"
}
