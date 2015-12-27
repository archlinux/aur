#Maintainer: MattD <1289367510 [at] qq.com>

pkgname=wine-qqintl
pkgver=0.0.1
pkgrel=1
pkgdesc='Wine QQ International 2012 by Deepin.'
arch=('i686' 'x86_64')
url='http://www.imqq.com/'
license=('Other')
source=("deepinwine-qq2012_0.0.1_i386.deb::http://packages.linuxdeepin.com/deepin/pool/main/d/deepinwine-qq2012/deepinwine-qq2012_0.0.1_i386.deb")
md5sums=('39aab69629d97cad6dbf98bb3acb9918')

if [ "$CARCH" = "i686" ]; then
  depends=('gtk2' 'lcms' 'ncurses' 'alsa-plugins' 'libsm' 'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-lcms' 'lib32-ncurses' 'lib32-alsa-plugins' 'lib32-libsm' 'lib32-libpng12')
fi

package()
{
    tar xzvf data.tar.gz -C ${pkgdir}/
}
