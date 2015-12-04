# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: 
# Contributor: 

pkgname='umplayer'
pkgver='0.98.2'
_sver='4.2'
pkgrel='2'
pkgdesc='An alternative to SMPlayer'
arch=('i686' 'x86_64')
url='http://www.umplayer.com/'
license=('GPL')
depends=('qt4' 
	 'hicolor-icon-theme')
install=${pkgname}.install
source=("http://download.opensuse.org/repositories/home:/zhonghuaren/Fedora_23/${CARCH}/${pkgname}-${pkgver}-${_sver}.${CARCH}.rpm")
if [[ $CARCH = x86_64 ]]; then
  md5sums=('b30d3d191918db98ba3b67c6e36625d8')
else
  md5sums=('cab5b5537e6d22cf4c42d06fbc7e3ce3')
fi

build() {
  cd ${srcdir}
  bsdtar -xf "${pkgname}-${pkgver}-${_sver}.${CARCH}.rpm" -C .
}

package() {
  cd ${srcdir}
  mv usr ${pkgdir}
}
