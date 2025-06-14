# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Jay Tauron <jytrn@protonmail.com>

pkgname=s-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="https://github.com/zquestz/s"
license=('MIT')
makedepends=()
options=('!strip' '!emptydirs')
provides=("s")
source=("${pkgname}_${pkgver}.zip::https://github.com/zquestz/s/releases/download/v${pkgver}/s-linux_amd64.zip")
sha256sums=('15372a9e6b0f1f554af23e85984fb6a9bf4de5f552eec8f5bab6ababa9173e36')

package() {
	cd "${srcdir}/s-linux_amd64"

	install -Dm775 "s" "${pkgdir}/usr/bin/s"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/s/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/s/README.md"
}
