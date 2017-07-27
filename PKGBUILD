# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=achemso
pkgname=texlive-"$_basename"
pkgver=3.10i
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

sha512sums=('c1168850ed25501bab6fe431367c8c44946bb2c3c519ea19e968f2377cd62ea6a067049cc62b212375fbb4b665dc610b3e34f601715dd0c9de6c760e96a1d2da')
