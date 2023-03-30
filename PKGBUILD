# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: James Campos <james.r.campos@gmail.com>

_pkgname=Pim
pkgname=pim
pkgver=0.10.1
pkgrel=4
pkgdesc="Python image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('desktop-file-utils' 'python-gobject')
optdepends=("libheif: support for HEIF/HEIC"
            "libjxl: support for JPEG XL"
            "webp-pixbuf-loader: support for the webp format")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Narrat/Pim/archive/$pkgver.tar.gz")
sha256sums=('b8d1f91f7baacb7770826f9eda97b890cc7418f42e6254ef0b2d2ecdb4e3982e')


package() {
  cd "$_pkgname-$pkgver"

  install -D -m755 pim $pkgdir/usr/bin/pim
  install -D -m644 LICENSE-MIT $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}

# vim:set ts=2 sw=2 et:
