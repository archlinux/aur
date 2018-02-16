# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=0.5.1
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
sha256sums=('f811d29df1b14f71f9e4c14622c949f8b7a1a049ca970e62811933e37a128727')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "$(find bin -type f)"
}
