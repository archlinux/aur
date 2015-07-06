# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-new-athena-unicode
_pkgname=NAU
pkgver=4.05
pkgrel=1
pkgdesc="A freeware multilingual font distributed by the American Philological Association."
arch=(any)
license=('OFL')
url="http://ist-socrates.berkeley.edu/%7Epinax/greekkeys/NAUdownload.html"
depends=('fontconfig' 'xorg-font-utils')
source=("http://ist-socrates.berkeley.edu/%7Epinax/greekkeys/fonts/${_pkgname}${pkgver//./}.zip")
install=ttf.install
md5sums=('fd7d0b23c7b1ec8b6fa0d37ca13b6a15')
sha1sums=('1caf660220980dd4d9f91fc5f0b97b75888d262a')
sha256sums=('0af642543c3869a26d2a43744c570594481d14fd6b5deffb11140d5f03bb633e')

package() {
  cd $srcdir/${_pkgname}${pkgver//./}
  install -Dm644 newathu405.ttf $pkgdir/usr/share/fonts/TTF/newathu405.ttf
  install -Dm644 AboutNAUfont_v4_05.rtf $pkgdir/usr/share/doc/$pkgname/AboutNAUfont_v4_05.rtf
}

