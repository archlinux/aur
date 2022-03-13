pkgname=artisan-roaster-scope
pkgver=2.6.0
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
'09bbec4b2cfa52c22a5611b67d25210dc2c9d383c36b95adb922e2d00cf70065'
)
options+=(!strip) # stripping causes crashes

prepare() {
	tar -xf data.tar.gz
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
