# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Max Demian <serialoverflow@gmail.com>

pkgname=awmtt
pkgver=0.5
pkgrel=2

pkgdesc="Test and preview your AwesomeWM configuration with Xephyr"
arch=("any")
url="https://github.com/gmdfalk/awmtt"
license=("MIT")

depends=(
	"bash"
	"xorg-server-xephyr"
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('032a08f979b5852b6d9680c338eba8aefe450b58b83149fa75f0c6420e10c175437c902fe7ac9aa7b21c07d3b9e8fff562d306b1e5c035896d50f9eab86c1e84')

package() {
	# Install
	install -v -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install LICENSE file
	install -v -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
