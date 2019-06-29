_pkgname=docbook-wrapper
pkgname=mingw-w64-$_pkgname
pkgver=1.0
pkgrel=1
arch=(any)
pkgdesc="Symlink system docbook-* packages (mingw-w64)"
license=(custom)
url='https://docbook.org/'

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    install -d "$pkgdir/usr/${_arch}/share/xml"
    ln -s "/usr/share/xml/docbook" "$pkgdir/usr/${_arch}/share/xml/docbook"
  done
}

# vim:set sw=2 et:
