#Maintainer: MattD <1289367510 [at] qq.com>

pkgname=wine-qqintl
pkgver=0.1.3
pkgrel=2
pkgdesc='Wine QQ International by Deepin.'
arch=('i686' 'x86_64')
url='http://www.imqq.com/'
license=('Other')
source=("wine-qqintl_0.1.3-2_i386.deb::mirror://sourceforge.net/deepinwine-qqintl/wine-qqintl_0.1.3-2_i386.deb")
md5sums=('d0f3340da494a6b20c768b0bd51a999d')

if [ "$CARCH" = "i686" ]; then
  depends=('gtk2' 'lcms' 'ncurses' 'alsa-plugins' 'libsm' 'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-lcms' 'lib32-ncurses' 'lib32-alsa-plugins' 'lib32-libsm' 'lib32-libpng12')
fi

package()
{
    tar xzvf data.tar.gz -C ${pkgdir}/
}
