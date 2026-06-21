# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=bashcities
pkgver=1.2
pkgrel=2
pkgdesc="A Neocities client that actually works, written in Bash."
arch=(any)
url="https://github.com/tatsumoto-ren/bashcities"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'curl' 'git' 'bash')
sha256sums=('7425af42482989178a56250b61b60677303a000f82b6e07d7b467e65315001c2')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
