# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=0.1.6
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
sha256sums=('f3a28b948c0e0c944c01d9a0d85e65c0beb9845d69d6206e2fc48a0a4b6f6ee7')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$(find bin -type f)"
}
