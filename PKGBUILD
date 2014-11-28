# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=netstiff
pkgver=20080331
pkgrel=2
pkgdesc="A powerful Web and FTP site update checker."
arch=('i686' 'x86_64')
url="http://pkqs.net/~sbeyer/#netstiff"
license=('GPL3')
depends=('ruby')
source=(http://pkqs.net/~sbeyer/tools/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)

md5sums=('afb24c1c966228664368f770dc42c021')

build() {
  cd "$startdir/src/${pkgname}_${pkgver}"

  make || return 1
  make DESTDIR="$startdir/pkg/usr" install
}
