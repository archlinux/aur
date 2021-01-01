# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=siji
pkgver=2021.01.01
pkgrel=1
pkgdesc='Iconic bitmap font based on stlarch with additional glyphs'
arch=('any')
url="https://github.com/TheCynicalTeam/siji"
license=('GPL3')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-xset')
optdepends=('xorg-xfd: use view.sh script to view glyphs')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
install=$pkgname.install
sha256sums=('532950e73806b3e3096f74fef8da928753c3164226721e6e07d7a3389f548605')

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -D -m644 bdf/siji.bdf "${pkgdir}/usr/share/fonts/misc/siji.bdf"
}
