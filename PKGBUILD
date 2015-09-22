# Maintainer: Yushin Washio <yuwash at yandex dot com>
 
pkgname='cloudme-sync'
pkgver=1.9.1_1.2
pkgrel=1
pkgdesc='The CloudMe Sync software for Linux, integrates the CloudMe service with your computer. It enables syncing of multiple folders, sharing and accessing all followed folders.'
arch=('i686' 'x86_64')
url='https://www.cloudme.com'
license=('LGPL')
depends=('qt5-tools>=5.3.0')
_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'
source=("https://www.cloudme.com/downloads/cloudme-sync_${pkgver//_/-}_${_arch}.deb")
 
md5sums=('35fdf2b35994279c7c641d96dc348a50')
 
[ "$CARCH" = "x86_64" ] && 
md5sums=('4b74d377b0f69f9d52904c58839a651d')
 
package() {
        cd $srcdir
 
        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir
}
