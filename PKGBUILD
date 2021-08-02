# Maintainer: bdumont <bastien dot dumont at posteo dot net>
# Authors: Jean-Luc Fournet, Ralph Hancock and Adam Bülow-Jacobsen
pkgname=ttf-ifao-grec
_pkgname=IFAOGrec_2nd_edn_final
pkgver=2.0
pkgrel=2
pkgdesc="Greek polytonic font suitable for specialized text editing."
arch=('any')
url="https://www.ifao.egnet.net/publications/outils/polices/#grec"
license=('public domain')
source=("http://www.ifao.egnet.net/uploads/polices/$_pkgname.zip")
md5sums=('6a0e32ce4541ccf47686969da11432e8')
sha1sums=('5c385c0da090737fb25ebc8dd6501ee5b2d4858d')
sha256sums=('bba12fc442242ad7381683d48ad417d5f9a42c5a366147adbe0293c044b6b267')

package() {
  cd "$srcdir/IFAOGrec 2nd edn final"
  mkdir -p $pkgdir/usr/share/{fonts/TTF,doc/$pkgname}
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 *.pdf $pkgdir/usr/share/doc/$pkgname/
}

