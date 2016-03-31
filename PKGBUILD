# Submitter: McNoggins < gagnon88 at gmail >
pkgname=pdfedit-bin
pkgver=0.4.5
_debpkgrel=2
pkgrel=4
pkgdesc="Full featured editor for manipulating PDF documents (built from Debian binaries)"
url="http://pdfedit.petricek.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt3' 't1lib' 'gsfonts' 'zlib')
provides=('pdfedit')
conflicts=('pdfedit')

if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=('1fed814ad4516877d9a125ba6fc73a4771da0cc80601d59f3c6440ea97cf9ccd')
else
  _debarch=amd64
  sha256sums=('3c64fa6e242a2e6b7df6996c55b2c663680878833093ce3142d622dec511c7ad')
fi

source=(http://old-releases.ubuntu.com/ubuntu/pool/universe/p/pdfedit/pdfedit_${pkgver}-${_debpkgrel}_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 ft=sh et:
