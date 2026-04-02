# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: cuihao <cuihao dot leo at gmail dot com>

pkgname=ttf-hanazono
pkgver=20170904
_revision=68253
pkgrel=5
pkgdesc='A free Japanese kanji font, which contains about 78,685 characters (and 2 SPACEs) defined in ISO/IEC 10646 standard / the Unicode standard.'
arch=('any')
url='https://glyphwiki.org/hanazono/'
license=('custom')
source=("${url}hanazono-${pkgver}.zip")
sha512sums=('f9cc55ed5e6ed5756e1e04a00c59d32b18a0fd4448d2a8bb109b6a25ad8d5a4729ca8d1df076a84986fc4a4524875fc2781befcf000842f6829492f1f9d6d37f')

package() {
  cd "$srcdir"
  install -Dm644 HanaMinA.ttf "$pkgdir/usr/share/fonts/TTF/HanaMinA.ttf"
  install -Dm644 HanaMinB.ttf "$pkgdir/usr/share/fonts/TTF/HanaMinB.ttf"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

