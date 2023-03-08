# Maintainer: Lena Fuhrimann

pkgname=moq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.1
pkgrel=1
pkgdesc='Interface mocking tool for go generate'
arch=(x86_64)
url="https://github.com/matryer/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('b73add82ce2d9dc1bbc46e4dcfcfa04dcb022fb25d8922bf85f7521d5bff7e14')

package() {
	install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
