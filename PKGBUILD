# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname=clouddl-git
provides=(clouddl)
conflicts=(clouddl)
pkgver=0.2
pkgrel=1
pkgdesc="Downloads files behind cloudflare's anti-bot page"
arch=(any)
url="https://github.com/Caesim404/clouddl"
license=(MIT)
depends=(python-cfscrape)
optdepends=("wget: wget support")
source=("git+https://github.com/Caesim404/clouddl.git")
sha256sums=("SKIP")

package() {
	cd "${srcdir}/clouddl"
	
	install -Dm755 clouddl.py "${pkgdir}/usr/bin/clouddl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/clouddl/LICENSE"
}
