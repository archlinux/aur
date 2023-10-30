# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

pkgname=kemono-scraper-bin
pkgver=0.0.21
pkgrel=1
pkgdesc='A simple downloader to download media from kemono.party, binary release.'
arch=('x86_64')
url='https://github.com/elvis972602/Kemono-scraper'
license=('MIT')
provides=('kemono-scraper')
conflicts=('kemono-scraper')
source=("https://github.com/elvis972602/Kemono-scraper/releases/download/v$pkgver/kemono-scraper")
sha256sums=('7abff31796cc33281ea262d749ec7ee25bdae5d24622a6dc7976120625a9f3f0')

package() {
	cd "$srcdir/"

	install -Dm755 kemono-scraper "${pkgdir}/usr/bin/kemono-scraper"
}
