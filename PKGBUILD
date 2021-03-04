# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=achemso
pkgname=texlive-"$_basename"
pkgver=3.13c
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

sha512sums=('97d87d237b0f0e66de9ac385ea181d7a5fd626aebda4fe1b9826e68727ee5dd9842744d2c6e3da4a3cc5a984604fa7026c13d9aa76546ee74c7fe3a0fe234252')
