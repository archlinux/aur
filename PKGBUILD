# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=ccsm
pkgver=0.8.10
pkgrel=2
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="http://www.northfield.ws/projects/compiz/releases/0.8.10/"
license=('GPL')
depends=("compizconfig-python" 'pygtk')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2' 'python2-sexy: needed for some widgets')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm-git')
provides=("ccsm=$pkgver")
source=("http://www.northfield.ws/projects/compiz/releases/${pkgver}/${pkgname}.tar.gz")
install=ccsm.install
md5sums=('a9b14472e65fe6e9bc37207cb36d993e')

package() {
  cd "${srcdir}/${pkgname}"
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}"
}
