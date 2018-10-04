pkgname=artisan-roaster-scope
pkgver=1.4.0
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
'48e507af81d730c55877846e71610c656433cc4a24590a5951165520a517482b'
)
options+=(!strip) # stripping causes crashes

prepare() {
	tar -xf data.tar.gz
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
