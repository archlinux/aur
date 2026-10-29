# Maintainer: Vardan Tarayan <vardanheroic@gmail.com>
pkgname='solarbg'
pkgrel=1
pkgver=2.0.2
pkgdesc="Sun altitude based wallpapers "
arch=('any')
url="https://github.com/VardanHeroic/solarbg"
license=('GPL-3.0-only')
depends=('nodejs>=17.1.0')
makedepends=('git' 'npm')
optdepends=(
	'feh: x11 tiling wm support',
	'swaybg: wlroots based wayland compositors support')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
replaces=('solarbg-git')
md5sums=('SKIP')
noextract=("${pkgname}-${pkgver}.tgz")


package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

}
