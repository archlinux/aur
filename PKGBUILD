# Maintainer: Laércio de Sousa <laerciosousa@sme-mogidascruzes.sp.gov.br>
pkgname=keepass-pt-br
pkgver=2.30
pkgrel=1
pkgdesc="Brazilian Portuguese locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('p7zip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_BR.zip)
arch=(any)
sha256sums=('896f81a898a01dad80f085337718e4e7f2fa1a5b2e6772f20b74c411744f63fc')
noextract=(KeePass-${pkgver}-Portuguese_BR.zip)

build(){
   cd ${srcdir}
   7z x KeePass-${pkgver}-Portuguese_BR.zip
}

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 Portuguese_BR.lngx "${pkgdir}/usr/share/keepass"
}
