# Maintainer: David Birks <david@tellus.space>
# Contributor: McNoggins <gagnon88 at gmail>

pkgname=pdfedit-bin
pkgver=0.4.5
_debpkgrel=2
pkgrel=1
pkgdesc="Editor for manipulating PDF documents"
url="http://pdfedit.petricek.net/"
arch=("i686" "x86_64")
license=("GPL")
depends=("qt3" "t1lib" "gsfonts" "zlib")
provides=("pdfedit")
source_i686=("http://old-releases.ubuntu.com/ubuntu/pool/universe/p/pdfedit/pdfedit_${pkgver}-${_debpkgrel}_i386.deb")
source_x86_64=("http://old-releases.ubuntu.com/ubuntu/pool/universe/p/pdfedit/pdfedit_${pkgver}-${_debpkgrel}_amd64.deb")
sha256sums_x86_64=("3c64fa6e242a2e6b7df6996c55b2c663680878833093ce3142d622dec511c7ad")
sha256sums_i686=("1fed814ad4516877d9a125ba6fc73a4771da0cc80601d59f3c6440ea97cf9ccd")

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}
