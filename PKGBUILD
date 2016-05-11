#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=makedep
pkgver=2014.8
pkgrel=3
pkgdesc='Convert Pacman optional dependencies to real dependencies.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/makedep"
depends=('pacman<6.0' pyalpm python3)
source=(
  http://xyne.archlinux.ca/projects/makedep/src/makedep-2014.8.tar.xz
  http://xyne.archlinux.ca/projects/makedep/src/makedep-2014.8.tar.xz.sig
)
sha512sums=(
  e79b5452ce40cc01fdb1c41d902867a3ccf8542fba001218ddca3463d750c741ee40552b6196bccdd3d22084203221ed6e82d5b1bdf83fa231c913c208b7a380
  1f7b75a17b2fc164b6b0609786747947031f51ed69d8bac380c8e15e41b1c26e2dbaa9499cd71c290c4666e8f052571e05012610a4d77cbca814934d88ff5abc
)
md5sums=(
  29eb84996e6c08a500b87046cd54fc54
  b3071bcf66f006df13b432707f5d93fd
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
