# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=0.6.0
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
sha256sums=('fa9bc2c6a197096812b6f4a5a284d13b38bbdba4ee1fc6586a60c9a63337b4d8')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$(find bin -type f)"
}
