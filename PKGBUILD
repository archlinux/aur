#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2021
pkgrel=15
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/obfilebrowser"
depends=(mimeo python-pyxdg python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/obfilebrowser/src/obfilebrowser-2021.tar.xz
  https://xyne.dev/projects/obfilebrowser/src/obfilebrowser-2021.tar.xz.sig
)
sha512sums=(
  329b11a5c39eda834b4e4577ab5dfcc7a5a7c255d3f2ccce1ea3e8c280d8b507082b0496061d449e483ee113097a38bd8159383f7c58ab38966a85357bd28910
  02c7d7cbd7db23b0562208e8e9ccf71ef7b690cea34e329dfaaf843fa1f545a2d084c246c8a6c0ecfcb76f0a84c55e1d16b9e8361141a775b2720f1aa6c198ea
)
md5sums=(
  86f955d0df1859ccf0a50eb0e9f56369
  e8180de1f56de6d9fd57de8ea75416b5
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
