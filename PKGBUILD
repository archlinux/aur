#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.tar.xz.sig
)
sha512sums=(
  13257a4aa659c149a91d44e83d27766cb92ccdc690478fb91ae02a2497bab4fcf20dce4e8b20e8e9fe625136de39bc8fcd278832b2da956f1c14aa0700470bd3
  9849fd811f29bc336d336a3f8898c5a7a39d287a3a10e50c1fe0f2117c423e40653e936139eae8a449a74d39589d23cb434b19f14b6225d21a84285cef3a55a7
)
md5sums=(
  15e6b759229ab80c74b5be4ead6f4bf0
  6de0009ff00b968faf1ca9492f6e57dd
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  ./scripts/helper.sh build
}

package ()
{
  cd -- "${srcdir}/${pkgname}-${pkgver}"
  install -Dm4755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
