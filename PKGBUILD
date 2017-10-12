# Maintainer: Reza Farrahi M <imriss@yahoo.com>

pkgname=jgnash-git
pkgver=2.33.1
pkgrel=1
pkgdesc="Cross platform personal finance application written in Java - Build from GitHub"
arch=('any')
url="http://sourceforge.net/projects/jgnash/"
license=('GPL3')
provides=('jgnash')
conflicts=('jgnash')
depends=('java-runtime' 'jdk8-openjdk' 'java-rhino' 'java-openjfx' 'rhino' 'gradle' 'java-environment-common' 'java-runtime-common')
source=(https://github.com/ccavanaugh/jgnash/archive/master.tar.gz)
sha256sums=('dec107820d104ae40be685ff1c53be23f726071cbc00012431e9efeb2b5bb7c6')
md5sums=('8b1e987b2f826884877813f79e0d08ed')

prepare() {
  cd "${srcdir}"/jgnash-master
  gradle clean DistTar
}

