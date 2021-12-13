#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2021
pkgrel=2
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/obfilebrowser"
depends=(mimeo python-pyxdg python3)
source=(
  https://xyne.dev/projects/obfilebrowser/src/obfilebrowser-2021.tar.xz
  https://xyne.dev/projects/obfilebrowser/src/obfilebrowser-2021.tar.xz.sig
)
sha512sums=(
  329b11a5c39eda834b4e4577ab5dfcc7a5a7c255d3f2ccce1ea3e8c280d8b507082b0496061d449e483ee113097a38bd8159383f7c58ab38966a85357bd28910
  ed8bf81f55c82f6c3f7eea7afc66ae77da4eb1651eb5bae5a77f0e6fb2705e7451b20e819275165a2acd02682dc7a7f0b111c44b3c3823264868ac8a455a20d5
)
md5sums=(
  86f955d0df1859ccf0a50eb0e9f56369
  0dd1c673728cfaaf8b09587702f0f037
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
