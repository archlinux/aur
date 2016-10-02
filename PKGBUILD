# Maintainer: Yushin Washio <yuwash at yandex dot com>
 
pkgname='cloudme-sync'
pkgver=1.9.8_1.2
pkgrel=1
pkgdesc='The CloudMe Sync software for Linux, integrates the CloudMe service with your computer. It enables syncing of multiple folders, sharing and accessing all followed folders.'
arch=('i686' 'x86_64')
url='https://www.cloudme.com'
license=('LGPL')
depends=('qt5-tools>=5.3.0' 'libgnome-keyring')
_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'
source=("https://www.cloudme.com/downloads/cloudme-sync_${pkgver//_/-}_${_arch}.deb")
 
md5sums=('3073c8ac70b7dd0d6956b5009c826a57')
 
[ "$CARCH" = "x86_64" ] && 
md5sums=('15e6f13a455e8ba16c5c4ccf20361b1c')
 
package() {
        cd $srcdir
 
        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir
}
