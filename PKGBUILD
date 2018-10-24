pkgname=artisan-roaster-scope
pkgver=1.5.0
pkgrel=1
pkgdesc="Artisan is a software that helps coffee roasters record, analyze, and control roast profiles."
arch=("x86_64")
url="https://github.com/artisan-roaster-scope/artisan"
license=('GPL3')
depends=()
source=(
"https://github.com/artisan-roaster-scope/artisan/releases/download/v${pkgver}/artisan-linux-${pkgver}.deb"
)
sha256sums=(
'f01e23fa259b19b2778e32f8b5cdb0bcd9f0a8c86ffdce0a8c92039115d9a585'
)
options+=(!strip) # stripping causes crashes

prepare() {
	tar -xf data.tar.gz
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
