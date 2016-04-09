# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=ccsm
pkgver=0.8.12
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="http://www.northfield.ws/projects/compiz/releases/${pkgver}"
license=('GPL')
depends=('compizconfig-python' 'pygtk')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2' 'python2-sexy: needed for some widgets')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm-git')
provides=("ccsm=$pkgver")
source=("http://www.northfield.ws/projects/compiz/releases/${pkgver}/${pkgname}.tar.xz")
install=ccsm.install
md5sums=('69f16f5d9b2498d4947d597a1b844820')

package() {
  cd "${srcdir}/${pkgname}"
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}"
}
