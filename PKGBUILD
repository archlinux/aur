#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2012.12.24.1
pkgrel=3
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(util-linux ecryptfs-utils)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  55a5562f66a6e5486acec6b5c76bd6fbd14c9d12ffc049f0a71ff0ea3e1dcc1806ccfac2a462ded38e180b5ea23ae837ce08956f6ba269fa8b07aba0d0e5ba6e
  e5d9c197956c93698b8786bcd999aea950495e74d0e35016add78485cd0322e29329f98428e1311c8d3d08681494877102aebf848890a8f49d76edd0676b2db4
)
md5sums=(
  60ce1fab538942b64b8f8a1a33d3a17c
  5d04b5af1b3df2b04f81cb4c40a2805b
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
