# Submitter: McNoggins < gagnon88 at gmail >
pkgname=pdfedit-bin
pkgver=0.4.5
_debpkgrel=1
pkgrel=3
pkgdesc="Full featured editor for manipulating PDF documents (built from Debian binaries)"
url="http://pdfedit.petricek.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt3' 't1lib' 'gsfonts' 'zlib')
provides=('pdfedit')
conflicts=('pdfedit')

if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=('f85f26e213f3d056ccffdf80b9fe2fc1161258b64f745b212003af079f129be4')
else
  _debarch=amd64
  sha256sums=('bc30c4f0727c826851b18879e1c720c62401d8808ec28460bbdd33400fe2c37b')
fi

source=(http://ftp.us.debian.org/debian/pool/main/p/pdfedit/pdfedit_${pkgver}-${_debpkgrel}_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 ft=sh et: 
