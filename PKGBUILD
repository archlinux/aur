# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Jay Tauron <jytrn@protonmail.com>
pkgname=s-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=()
options=('!strip' '!emptydirs')
provides=("s")
source=("${pkgname}_${pkgver}.zip::https://github.com/zquestz/s/releases/download/v${pkgver}/s-linux_amd64.zip")
sha256sums=('47d9162e7a93410b2d5cb6533fa5dd924b6607dfd79199f6b96bb8b741e98203')

package() {
	cd "${srcdir}/s-linux_amd64"

	install -Dm775 "s" "${pkgdir}/usr/bin/s"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/s/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/s/README.md"
}
