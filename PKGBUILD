#Maintainer: M0Rf30

pkgname=appglass
pkgver=1.0
pkgrel=2
pkgdesc="A lightweight application Launcher for GNU/Linux"
arch=('i686' 'x86_64')
url="https://github.com/kumarasinghe/appglass/"
license=('GPL3')
depends=('gambas3-runtime' 'gambas3-gb-desktop' 'gambas3-gb-form' 'gambas3-gb-image' 'gambas3-gb-qt4'
	 'gambas3-gb-qt4-opengl' 'gambas3-gb-opengl' 'findutils' 'coreutils' 'wget' 'mplayer' 'imagemagick' 'xdg-utils'
	 'xterm' 'bash' 'xorg-xprop' 'xcompmgr')
conflicts=('appglass-git')
install=appglass.install
source=("https://github.com/kumarasinghe/$pkgname/archive/$pkgver.tar.gz")

package(){
  cd $pkgname-$pkgver
  cd installer
  tar -xvzf root.tar.gz -C $pkgdir
}

md5sums=('0fa5ff776108909464235438779d7e4b')
