# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=achemso
pkgname=texlive-"$_basename"
pkgver=3.13f
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

sha512sums=('08597b44ba78e09db8b4f6a5c3a722a21c6481a5da4e9c7525d3bb87d8b1c489a1159c71f69a46bb67c25700b9ae2fc6f03e0acc17f5c37e6fe8444f520057b8')
