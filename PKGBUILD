# Maintainer: Letu <fantasquex@gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=ttf-new-athena-unicode
_pkgname=NAU
pkgver=5.008
_pkgver=5_008
pkgrel=1
pkgdesc="A freeware multilingual font distributed by the American Philological Association."
arch=(any)
license=('OFL-1.1')
url="https://apagreekkeys.org/NAUdownload.html"
source=("https://apagreekkeys.org/fonts/${_pkgname}${_pkgver}.zip")
sha256sums=('cdfe5c38aac9c9c82568e7260cf79fe4c3f4d51461713b1485214104a6e7bbf1')

package() {
  cd $srcdir/${_pkgname}${_pkgver}
  for i in *.ttf; do
    install -Dm644 $i $pkgdir/usr/share/fonts/TTF/$i
  done
  install -Dm644 AboutNAUfont_v${_pkgver}.rtf $pkgdir/usr/share/doc/$pkgname/AboutNAUfont_v${_pkgver}.rtf
  install -Dm644 NAU5_OpenFontLicense.pdf $pkgdir/usr/share/licenses/$pkgname/NAU5_OpenFontLicense.pdf
}

