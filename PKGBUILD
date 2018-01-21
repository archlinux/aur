# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgname=artisan-roaster-scope
pkgver=1.2.0
pkgrel=1
pkgdesc="Artisan is a software that helps coffee roasters record, analyze, and control roast profiles."
arch=("x86_64")
url="https://github.com/artisan-roaster-scope/artisan"
license=('GPL3')
depends=( "python" )
source=(
"https://github.com/artisan-roaster-scope/artisan/releases/download/v${pkgver}/artisan-linux-${pkgver}_amd64.deb"
)
sha256sums=(
'292734bd254e49a93eb173869cb49c87c2ddca077eacbcde080c48fa8eeb5d6f'
)

prepare() {
	tar -xf data.tar.gz
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
