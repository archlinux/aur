#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.16.2
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.16.2.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.16.2.tar.xz.sig
)
sha512sums=(
  fd71df5627a3b3acdf3d002ecf47d728a44edca096fdcba9c6685e38d6664fe565c333b4c48be7e2823128430c2c2715e13ff2219824862ca881296b96b8b44a
  b348103e3f8f8d971101bf2889aed413f4b1a299d589698d31b0f978e23b2935ec2d0cefc7310e34866b265075d5463156f385b1892f828179dd7d019ee452c5
)
md5sums=(
  582f6666e5833a7ea9cb28d7f990bbbf
  682844f3a9d280585db07d569f02f74a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
