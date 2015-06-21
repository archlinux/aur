#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xynexdg
pkgver=2012.12.24.1
pkgrel=4
pkgdesc='Implementation of various freedesktop.org standards, for internal use in Xyne'"'"'s modules.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xynexdg"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-xynexdg/src/python3-xynexdg-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-xynexdg/src/python3-xynexdg-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  6653de168af4252d1be8e67b6daaa1c0ba91bb6de080f106392d298bfa702e72aa3d78b68bd833a0f6d825d8b21f9df009a00102289d5a0cccc996857c36509c
  7e8cc7a8441d2e1102ff29569b7227153dd9d1c20d40b34eb15e0c200e2163b61d0d9ea7c4e8931376a31e4d114ba01627c377fe15fb57e0010cd2ab1451cc6a
)
md5sums=(
  a6ddefdec93966a105ad4f02440ca32f
  d42588a485c7853efdf2305966883f98
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
