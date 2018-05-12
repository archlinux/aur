# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=achemso
pkgname=texlive-"$_basename"
pkgver=3.11a
pkgrel=1
pkgdesc="LaTeX support for American Chemical Society journal submissions."
arch=('any')
depends=('texlive-bin')
url="http://ctan.org/tex-archive/macros/latex/contrib/$_basename"
license=('custom')
source=("http://mirrors.ctan.org/macros/latex/contrib/$_basename.zip")

package() {
  mkdir -p -- "$pkgdir"/usr/share/texmf/
  cd -- "$pkgdir"/usr/share/texmf/
  bsdtar -xf "$srcdir/$_basename".zip
  find "$pkgdir" -type f -exec chmod 644 '{}' \+
  find "$pkgdir" -type d -exec chmod 755 '{}' \+
}

sha512sums=('97f8fff8cf7f8e9e0bcac8cdeb40b997418c1becb05dea025f2c865786618997880f8f2be055ec4dbfb9b7945bb7292f15a4512f5ddb4bf48de105c90aff22ff')
