# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Kory Woods <kory _at_ virlo >dot< net>
# Contributor: Aleix Pol <aleixpol@kde.org>

pkgname=miranda
pkgver=2.042
pkgrel=2
pkgdesc='Miranda programming language'
url='http://miranda.org.uk/'
license=('custom')
arch=('i686' 'x86_64')
source=("https://www.cs.kent.ac.uk/people/staff/dat/miranda/downloads/linux/mira-2042-i686-Linux.tgz")
md5sums=('1fc2340187480251b63fc1f855f678d2')

build() {
  cd $srcdir
}

package() {
  cp -r $srcdir/usr $pkgdir
}
