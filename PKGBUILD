# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
# Maintainer: Florian Jacob
pkgname=boost.process
pkgver=0.5
pkgrel=1
pkgdesc="Flexible framework for the C++ programming language to manage running programs"
url="http://www.highscore.de/boost/process0.5/"
license=('boost')
depends=('boost' 'gcc')
arch=('i686' 'x86_64')

source=('http://www.highscore.de/boost/process0.5/process.zip')

package()
{
  install -d $pkgdir/usr/include
  cp -r $srcdir/boost $pkgdir/usr/include
}

md5sums=('aa7e995dddf8a2cbb1c581b344f44b6e')
