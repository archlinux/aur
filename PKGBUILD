# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="jiq-bin"
pkgver=0.7.2
pkgrel=2

pkgdesc='Interactive JSON query tool using jq expressions'
arch=('x86_64')
url='https://github.com/fiatjaf/jiq'
license=('MIT')

depends=('jq')
provides=("jiq")
conflicts=("jiq")

source=("README.md::https://github.com/fiatjaf/jiq/raw/v${pkgver}/README.md"
	"LICENSE::https://github.com/fiatjaf/jiq/raw/v${pkgver}/LICENSE"
	"jiq::https://github.com/fiatjaf/jiq/releases/download/v${pkgver}/jiq_linux_amd64")

b2sums=('1db52e38549bf2e38dcfe7df9d564cb3ce5be56ee6af6c1bdb5e27c50887e786ed484ac7b572bf90c0d9ddf7967ba2497de825cf5c8d9a00ded3ec738cb75f41'
	'bc715507c1551ee3bf11013fe54c2ddb9e218092852401ce858b6d50b014e67463bcd7ede03c8332375254a9864ef3bb9005f90adad19083caa949e1935ffbe4'
	'893d6d919d2f51740965a88afcb8eef64d6ee3cc08f66e7afa5d1f6450eb84edf35d0db6362dcebfe7819d2e7398c4e3e39eaa7dbc142b7fab96e91c5e66a934')

package() {
	install -Dm755 "jiq" "${pkgdir}/usr/bin/jiq"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
