# Maintainer: Joachim Klahr <klarre@unix-like.se>

pkgname='dmenu-ntix'
_tag='39a719b34545ee2b01b7f5ab2a3a4554892ee03d'
pkgver=0.1.0
pkgrel=1
pkgdesc="Dmenu front-end to ntix."
arch=('any')
url="https://git.sr.ht/~klahr/dmenu-ntix"
license=('GPL2')
source=("https://git.sr.ht/~klahr/dmenu-ntix/archive/${_tag}.tar.gz")
sha256sums=('3e1f70b53d8eaf6189ee01313165e87393bf6fa1807b567b9522355095bb55d1')

package() {
	cd "${pkgname}-${_tag}"
	rm -rf "${pkgdir}/opt/${pkgname}/dmenu-ntix"
	mkdir -p "${pkgdir}/opt/${pkgname}/dmenu-ntix"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 src/dmenu-ntix.sh "${pkgdir}"/usr/bin/dmenu-ntix
}
