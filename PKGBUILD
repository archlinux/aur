# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname=cfdl
pkgver=0.2.1
pkgrel=1
pkgdesc="Downloads files behind cloudflare's anti-bot page"
arch=(any)
url="https://github.com/Caesim404/cfdl"
license=(MIT)
depends=(python-cfscrape)
optdepends=("wget: wget support")
source=("https://github.com/Caesim404/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("59125c676fea599081a51bed1d62e4c10b6bfde2201bc989dad1f263a88a9b5a")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	install -Dm755 cfdl.py "${pkgdir}/usr/bin/cfdl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cfdl/LICENSE"
}
