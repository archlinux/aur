# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.35
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('4a7ef96d289784ebf8966d14e706fa15d7b82e3c0493dd2b26c4f398925cee58')
sha256sums_i686=('d05a30b44311bcb96039fe1d2cb9c20662824a80a4c24c371f5677f47265aabc')

package() {
	install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
