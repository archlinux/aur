# Maintainer: _Zaizen_ <leonardocanello@protonmail.com>

pkgname=dotto-git
_pkgname=Dotto
pkgver=0
pkgrel=0
pkgdesc=''
arch=('x86_64')
url='https://github.com/LibreSprite/Dotto'
license=('MIT')
depends=('sdl2' 'freetype2' 'libjpeg-turbo' 'sdl2_image' 'lua')
makedepends=('make' 'git')

source=(
	"git+https://github.com/LibreSprite/Dotto.git"
)

sha256sums=(
    'SKIP'
)



prepare() {
	cd "$_pkgname"

}

build() {
	cd "$_pkgname"
	make -j 4
}

package() {
    install -Dm755  "${srcdir}/Dotto/dotto" "${pkgdir}/usr/bin/dotto"
}

