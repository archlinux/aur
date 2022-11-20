# Maintainer: Lena Fuhrimann

pkgname=moq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.0
pkgrel=1
pkgdesc='Interface mocking tool for go generate'
arch=(x86_64)
url="https://github.com/matryer/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('f64bbdcfaa742d246b3833a268ee2e1c6eda4452a1e152dcbc091aa256e9bc0d')

package() {
	install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
