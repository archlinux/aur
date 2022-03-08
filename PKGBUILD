# Maintainer: Nick Silverman <nsilverman at ruegiltgroupe dot com>

_pkgname='aws-mfa'
pkgname="${_pkgname}-bin"
pkgver=2.2.1
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
sha256sums=(7f606b5ce708cdf6e86dd5b5779c586fccb6c24263814808a1e6a9248980e558)

package() {
	install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
