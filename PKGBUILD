# Maintainer: allencch at hotmail dot com
pkgname=chinese-calendar
pkgver=1.0.1
pkgrel=2
pkgdesc="Chinese traditional calendar for Ubuntu Kylin"
arch=('i686' 'x86_64')
url="https://launchpad.net/chinese-calendar/"
license=('GPL3')
source_i686=("https://launchpad.net/chinese-calendar/1.0/1.0.1/+download/${pkgname}_${pkgver}-0~49~ubuntu15.04.1_i386.deb")
md5sums_i686=('7c0cd10ec78def7f965014bad1c4b101')
source_x86_64=("https://launchpad.net/chinese-calendar/1.0/1.0.1/+download/${pkgname}_${pkgver}-0~49~ubuntu15.04.1_amd64.deb")
md5sums_x86_64=('1a131e62a2212521c64856a4caa5dd04')


package () {
  cd ${srcdir}
  _arch="amd64"
  [[ $CARCH == "i686" ]] && _arch="i386"
  ar xv ${pkgname}_${pkgver}-0~49~ubuntu15.04.1_${_arch}.deb
  tar xJf data.tar.xz
  mv usr etc ${pkgdir}
}
