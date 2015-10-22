# Maintainer: estebon <sanestebon at gmail dot com>
_basename=IEEEtran
pkgname=texlive-ieeetran
# Use "grep ProvidesExplPackage -r src/" to find the version.
pkgver=1.8b
pkgrel=1
pkgdesc="LaTeX class for authors of the Institute of Electrical and Electronics Engineers (IEEE) transactions journals and conferences."
arch=('any')
depends=('texlive-bin')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/"$_basename"/"
license=('LPPL')
source=(http://mirrors.ctan.org/macros/latex/contrib/"$_basename".zip)
install="$pkgname".install

package() {
  mkdir -p -- "$pkgdir"/usr/share/texmf-dist/tex/latex
  cd -- "$pkgdir"/usr/share/texmf-dist/tex/latex
  bsdtar -xf "$srcdir/$_basename".zip
  find "$pkgdir" -type f -exec chmod 644 {} \+
  find "$pkgdir" -type d -exec chmod 755 {} \+
}

sha1sums=('85928c0c8d286ff3dbed07c29ca6fb7d124e7c3e')
