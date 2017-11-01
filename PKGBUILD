#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=fipolate
pkgver=2017
pkgrel=1
pkgdesc='Interpolate text files with variables through a fifo via user prompts.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/fipolate"
depends=(python-pyinotify python3)
source=(
  https://xyne.archlinux.ca/projects/fipolate/src/fipolate-2017.tar.xz
  https://xyne.archlinux.ca/projects/fipolate/src/fipolate-2017.tar.xz.sig
)
sha512sums=(
  3df325656a2cd23c085ef39845190b117f9f290f074d26dfd7404b7c393f5cfe9c9d7517a975ce461febed40417b3e14545fb9a6038c8aea247778011879af22
  d40ac81deaa519267a15cddea16d650f3d6e31106faff0d3042d7ce246544d8bc8e254de5f09666b3b963f9303ed9d17bbb79ae5c088af58063ce83abf4d38ca
)
md5sums=(
  0857996a546241a426143f50956401ec
  3974569afc7d621a536211564a807308
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
