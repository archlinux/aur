# Maintainer: Nick Silverman <nsilverman at ruegiltgroupe dot com>

_pkgname='aws-mfa'
pkgname="${_pkgname}-bin"
pkgver=3.0.0
pkgrel=2
pkgdesc='A tool to generate/refresh temporary AWS credentials using MFA'
arch=('x86_64' 'aarch64')
url="https://github.com/RueLaLa/aws-mfa"
license=('MIT')
depends=('glibc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source_x86_64=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
sha256sums_x86_64=('1ab6996f25c658fc3b107ce21c8fdd774051165346b059e0ef476b3d14c12ff3')
sha256sums_aarch64=('4b4abe21cd48fb547638a9fa4e83e7849d750c83384df6c9506f02b81eb0d974')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
