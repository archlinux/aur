# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=bskyid
pkgver=1.0.1
pkgrel=1
pkgdesc="Unofficial application to fetch your BlueSky ID"
arch=(any)
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('bash')
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/BskyId#tag=v1.0.1")
sha256sums=('SKIP')

package() {
	cd "${pkgname}"
	make install DESTDIR=$pkgdir
}
