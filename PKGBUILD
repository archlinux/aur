# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.42
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('9802b08706ace7c60ac2e4552a4d7a8f249a7ca6d6e84d1b30e564024d1cd8e5')
sha256sums_i686=('ccec38b4ac410fdc0f98383729b32ba74adb7a2d57a86f7bfe70b41879ec63da')

package() {
	install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
