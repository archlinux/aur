pkgname=artisan-roaster-scope
pkgver=1.3.0
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
'3955d018aa9c2aba73c230d380c46fa938e36fca433ddeb240f20a4ffd8adc4c'
)
options+=(!strip) # stripping causes crashes

prepare() {
	tar -xf data.tar.gz
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
