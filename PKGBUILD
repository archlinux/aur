# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=schemes
pkgname=govarnam-schemes
pkgver=1.8.0
pkgrel=1
pkgdesc="Varnam Language support files for govarnam"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('MPL')
source=("${pkgname}-${pkgver}.zip"::"https://github.com/varnamproject/schemes/archive/refs/tags/v1.8.0.zip")
sha256sums=('51084589feeff4584ff26da1b37954c93e0938f6eabaedf4a9a20e3c867782a3')
makedepends=('ruby' 'ruby-ffi' 'govarnam')
provides=('govarnam-schemes')
install=${pkgname}.install

build() {
  cd ${_pkgname}-${pkgver}
  ruby compile-scheme.rb -s schemes/as/as.scheme -o schemes/as/as.vst

  ruby compile-scheme.rb -s schemes/bn/bn.scheme -o schemes/bn/bn.vst

  ruby compile-scheme.rb -s schemes/gu/gu.scheme -o schemes/gu/gu.vst

  ruby compile-scheme.rb -s schemes/hi/hi.scheme -o schemes/hi/hi.vst

  ruby compile-scheme.rb -s schemes/kn/kn.scheme -o schemes/kn/kn.vst

  ruby compile-scheme.rb -s schemes/ml/ml.scheme -o schemes/ml/ml.vst

  ruby compile-scheme.rb -s schemes/ml-inscript/ml-inscript.scheme -o schemes/ml-inscript/ml-inscript.vst

  ruby compile-scheme.rb -s schemes/mr/mr.scheme -o schemes/mr/mr.vst

  ruby compile-scheme.rb -s schemes/ne/ne.scheme -o schemes/ne/ne.vst

  ruby compile-scheme.rb -s schemes/or/or.scheme -o schemes/or/or.vst

  ruby compile-scheme.rb -s schemes/pa/pa.scheme -o schemes/pa/pa.vst

  ruby compile-scheme.rb -s schemes/sa/sa.scheme -o schemes/sa/sa.vst

  ruby compile-scheme.rb -s schemes/ta/ta.scheme -o schemes/ta/ta.vst

  ruby compile-scheme.rb -s schemes/te/te.scheme -o schemes/te/te.vst
}

package() {
  cd ${_pkgname}-${pkgver}
  mkdir -p "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/as/as.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/bn/bn.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/gu/gu.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/hi/hi.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/kn/kn.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/ml/ml.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/ml-inscript/ml-inscript.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/mr/mr.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/ne/ne.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/or/or.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/pa/pa.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/sa/sa.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/ta/ta.vst "${pkgdir}"/usr/share/varnam/schemes/
  cp schemes/te/te.vst "${pkgdir}"/usr/share/varnam/schemes/
}
