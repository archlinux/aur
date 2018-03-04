pkgname=artisan-roaster-scope
pkgver=1.2.0
pkgrel=2
pkgdesc="Artisan is a software that helps coffee roasters record, analyze, and control roast profiles."
arch=("x86_64")
url="https://github.com/artisan-roaster-scope/artisan"
license=('GPL3')
depends=()
source=(
"https://github.com/artisan-roaster-scope/artisan/releases/download/v${pkgver}/artisan-linux-${pkgver}_amd64.deb"
)
sha256sums=(
'e210bbbc6e09ebe2daa108a6598b8f02459fca3ddfa5136cd3ced347d71a3ef0'
)
options+=(!strip) # stripping causes crashes

prepare() {
	tar -xf data.tar.gz
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
