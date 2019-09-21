# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=achemso
pkgname=texlive-"$_basename"
pkgver=3.12a
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

sha512sums=('b6f72a06d28a140e1ec792340e8f6a47e63a8d6080f54b4dba42c253068cb3377f76ad9237ab348ed7ece05ac2b27df075ed8d40fb2da165757910bbacb1ab8a')
