#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=synclinks
pkgver=2015
pkgrel=1
pkgdesc='A tool that synchronizes hierarchies of symlinks.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/synclinks"
source=(
  http://xyne.archlinux.ca/projects/synclinks/src/synclinks-2015.tar.xz
  http://xyne.archlinux.ca/projects/synclinks/src/synclinks-2015.tar.xz.sig
)
sha512sums=(
  1550776a58ed996b4322a674aba6df0a2db624cbde248c791a5cc60b590d626f615176a0e55ea3621a3aa48d5528f5591c5dcbd0f6d00c716d9827616878b9f6
  596fbb44d3f239480e2cae16d839e0ba89424d5cbd913bca43081cf35aa0b0f20fe2d5f57fb0c6e76d0fa43a9323d026b2db2cf3a590fa1fc3838499a6f594a7
)
md5sums=(
  6f0cd0812e1a4bb60763aa5b8108b6dd
  ecca419b29561538fe9abd4ddaf29ced
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make
}

package ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
