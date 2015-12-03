# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=lpmlibs
pkgver=1
pkgrel=1
pkgdesc="Adds 2 Neccessary PortMidi Library Files For jammr To Work"
arch=('i686' 'x86_64')
options=('!strip')

source=("https://github.com/THEGUSPROJECT/thegusproject.github.io/blob/master/assets/files/lpmlibs.zip?raw=true")
md5sums=('61910cff6e580d2f3206d4f2d0e8ec2e')

depends=("portmidi")

package() {
  mkdir -p $pkgdir/usr/lib 
  cd $srcdir
  cp -r usr/lib $pkgdir/usr/lib
}