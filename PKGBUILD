# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=0.2.10
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
sha256sums=('e92d2b7389379257b442adeae619237aeae997004d514f60a4c7d62a3571ace5')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$(find bin -type f)"
}
