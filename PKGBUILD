# Maintainer: 5amu <v.casalino@protonmail.com>
pkgname=dnshunter
pkgver=1
pkgrel=0
_version="${pkgver}.${pkgrel}"
pkgdesc="Just a program to perform some DNS/BGP security assessments automatically"
arch=( 'x86_64' )
url="https://github.com/5amu/dnshunter"
license=( 'GPLv3' )
depends=()
source=("${pkgname}_linux_amd64.zip::${url}/releases/download/v${_version}/${pkgname}_linux_amd64.zip")
sha256sums=('SKIP')

package() {
	cd "$srcdir/${pkgname}_linux_amd64"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}