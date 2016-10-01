# Maintainer: Rainbow <rainbowtupperware@openmailbox.org>

pkgname=blackpearl
pkgver=0.0.5
pkgrel=1
pkgdesc="Watch movies and series from The Pirate Bay in your terminal"
arch=('any')
url="https://www.npmjs.com/package/blackpearl"
license=('WTFPL')
depends=('nodejs' 'npm' 'mpv')
makedepends=('npm')
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/rainbowintheshell/blackpearl.git')
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr"
}
