# Maintainer: NBonaparte <nbonaparte at protonmail dot com>

pkgname=otf-etbb
pkgver=1.057
pkgrel=1
pkgdesc="An expansion of Edward Tufte’s ET-Bembo family"
arch=('any')
url="https://www.ctan.org/pkg/etbb"
license=('MIT')
source=("http://mirrors.ctan.org/fonts/etbb.zip")
sha256sums=('910c7f2a4ca2ceec486fecaa2e77c441a2249ef767c948716ef3a1ed8ef08e99')

package() {
	install -Dm644 "${srcdir}"/etbb/opentype/*.otf -t "${pkgdir}"/usr/share/fonts/OTF
}
