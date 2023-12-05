# Maintainer: Vardan Tarayan <tarayanvardan@gmail.com>
pkgname='solarbg'
pkgrel=5
pkgver=1.3.1
pkgdesc="Sun altitude based wallpapers "
arch=('x86_64')
url="https://github.com/VardanHeroic/solarbg"
license=('GPL')
depends=('nodejs>=16.0.0')
makedepends=('git' 'npm')
optdepends=(
	'feh: x11 tiling wm support',
	'swaybg: wlroots based wayland compositors support')
source=('https://registry.npmjs.org/solarbg/-/solarbg-1.3.1.tgz')
replaces=('solarbg-git')
md5sums=('SKIP')
noextract=("${_pkgname}-${pkgver}.tgz")


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

}
