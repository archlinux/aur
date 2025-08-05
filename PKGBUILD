# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=prasmoid
pkgver=0.0.3
pkgrel=1
pkgdesc="The All in One Development Toolkit for KDE Plasmoids. Build, test, and manage your plasmoids with unparalleled ease and efficiency."
arch=("x86_64")
url='https://github.com/PRASSamin/prasmoid'
license=("MIT")
depends=(
	"plasma-sdk"
	"git"
	"qt6-declarative"
)
source=(
	"https://github.com/PRASSamin/prasmoid/releases/download/v0.0.3/prasmoid"
	"https://raw.githubusercontent.com/PRASSamin/prasmoid/refs/tags/v0.0.3/LICENSE.md"
	"https://raw.githubusercontent.com/PRASSamin/prasmoid/refs/tags/v0.0.3/README.md"
)
sha256sums=(
	"72e4c2b772188ff7ac3ac1b210238a2b9aff1ef8a2844f11df999a44990dcc96"
	"1f3c5281949e670ffb5efacaae5acd3160eaa5ff1b19c0eab57987581f34fd93"
	"dd454961c774a1b92546cb3c5567c7f9d3a4191f195860a07478fbd845c93003"
)
package() {
	install -Dm755 prasmoid "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
