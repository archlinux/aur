# Maintainer: Abdulhaq Emhemmed <el.ingeniero09@gmail.com>
pkgname=green-recorder
pkgver=1.1
pkgrel=1
pkgdesc="A simple yet functional desktop recorder for Linux systems."
arch=('i686' 'x86_64')
url="https://github.com/green-project/green-recorder"
license=('GPL')
groups=()
depends=('python2'
         'libappindicator-gtk3'
         'gawk'
         'python2-gobject'
         'python2-urllib3'
         'xorg-utils'
         'ffmpeg')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/green-project/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e0a4c76696054e00c883fa8a71d84788')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
