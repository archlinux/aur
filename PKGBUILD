#Maintainer: M0Rf30

pkgname=appglass-git
pkgver=1.0.1.g162fc1d
pkgrel=1
pkgdesc="A lightweight application Launcher for GNU/Linux"
arch=('i686' 'x86_64')
url="https://github.com/kumarasinghe/appglass/"
license=('GPL3')
depends=('gambas3-runtime' 'gambas3-gb-desktop' 'gambas3-gb-form' 'gambas3-gb-image' 'gambas3-gb-qt4'
	 'gambas3-gb-qt4-opengl' 'gambas3-gb-opengl' 'findutils' 'coreutils' 'wget' 'mplayer' 'imagemagick' 'xdg-utils'
	 'xterm' 'bash' 'xorg-xprop' 'xcompmgr')
makedepends=('git')
install=appglass.install
source=('appglass::git+https://github.com/kumarasinghe/appglass.git')

package(){
  cd appglass
  cd installer
  tar -xvzf root.tar.gz -C $pkgdir
}

pkgver() {
  cd appglass
  echo $(git describe --tags) | sed 's/[-: ]/./g'
}

md5sums=('SKIP')
