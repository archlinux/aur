# Maintainer: Nick Silverman <nsilverman at ruegiltgroupe dot com>

_pkgname='aws-mfa'
pkgname="${_pkgname}-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc='A tool to generate/refresh temporary AWS credentials using MFA'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/RueLaLa/aws-mfa"
license=('MIT')
depends=('glibc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_goos}_${_goarch}")
sha256sums=(1ab6996f25c658fc3b107ce21c8fdd774051165346b059e0ef476b3d14c12ff3)

package() {
	install -Dm 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
