# Maintainer: Lena Fuhrimann

pkgname=moq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.7
pkgrel=3
pkgdesc='Interface mocking tool for go generate'
arch=(x86_64)
url="https://github.com/matryer/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('62e5223300d7727744c7abefcabb11750bb53355be2ba73480a84a58788bd949')

package() {
	install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
