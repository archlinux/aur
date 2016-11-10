# Maintainer: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=bspwm-kde-session
pkgver=0.1
pkgrel=1
pkgdesc='Start a KDE session with the bspwm window manager'
arch=('any')
url='https://github.com/danielgreve/bspwm-kde-session'
license=('custom:UNLICENSE')
depends=('bspwm' 'plasma-workspace')
source=("https://github.com/danielgreve/bspwm-kde-session/archive/${pkgver}.tar.gz")
md5sums=('478e0a5d382ff86041c86c3dc632adcd')

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
