#Program author: https://vk.com/mikhailnov
#Maintainer: naruto522ru <itachi522ru@gmail.com>
_srcver=2.2
_srcname=pulsejoin$_srcver

pkgname=pulsejoin
pkgver=2.2
pkgrel=1
#pkgdesc=''
arch=('any')
url='https://gitlab.com/mikhailnov/pulsejoin'
license=('GPL3')
depends=('pulseaudio' 'pavucontrol' 'yad')
makedepends=('git')
source=("$_srcname::git+https://gitlab.com/mikhailnov/pulsejoin.git#tag=v$_srcver")
sha256sums=('SKIP')

package() {
        cd "$srcdir"/$_srcname/
        make DESTDIR="${pkgdir}/" install
}
