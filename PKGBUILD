# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname='lcab'
pkgver='1.0b12'
pkgrel='5'
pkgdesc='A program to make Microsoft cabinet files'
arch=('x86_64')
license=('GPL')
url='http://ohnopub.net/~ohnobinki/lcab/'
depends=('glibc')
#source=("ftp://ohnopublishing.net/mirror/${pkgname}-${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.gz::https://launchpadlibrarian.net/14108055/${pkgname}_${pkgver}.orig.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::http://mirrors.gigenet.com/archlinux/other/lcab/${pkgname}-${pkgver}.tar.gz")
md5sums=('9403e08f53fcf262e25641a9b900d4de')
sha256sums=('065f2c1793b65f28471c0f71b7cf120a7064f28d1c44b07cabf49ec0e97f1fc8')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dpm755 'lcab' "${pkgdir}/usr/bin/lcab"
}
