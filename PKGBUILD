# Maintainer: Pablo Palazon <ppalazon@phyxor.com>

: ${_commit:=6e2b703b3df79fecf04cadc9c54ea68459856e50}

_fontname="science-gothic"
_pkgname="ttf-$_fontname"
pkgbase="$_pkgname"
pkgname=("${_pkgname}" "${_pkgname}-variable")
epoch=1
# pkgver: git-pkgver (4th - https://wiki.archlinux.org/title/VCS_package_guidelines#Git)
pkgver=r964.6e2b703b3d
pkgrel=1
pkgdesc="A 4-axis variable font with a wide design range by Google Fonts"
arch=('any')
license=('OFL-1.1-no-RFN')
url="https://github.com/googlefonts/science-gothic"
source=(
  "ScienceGothic-Blk-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-Blk.ttf"
  "ScienceGothic-BlkCnd-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-BlkCnd.ttf"
  "ScienceGothic-BlkCndCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-BlkCndCtr.ttf"
  "ScienceGothic-BlkCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-BlkCtr.ttf"
  "ScienceGothic-BlkExp-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-BlkExp.ttf"
  "ScienceGothic-BlkExpCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-BlkExpCtr.ttf"
  "ScienceGothic-CndCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-CndCtr.ttf"
  "ScienceGothic-Ctr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-Ctr.ttf"
  "ScienceGothic-ExpCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-ExpCtr.ttf"
  "ScienceGothic-Lt-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-Lt.ttf"
  "ScienceGothic-LtCnd-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-LtCnd.ttf"
  "ScienceGothic-LtCndCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-LtCndCtr.ttf"
  "ScienceGothic-LtCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-LtCtr.ttf"
  "ScienceGothic-LtExp-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-LtExp.ttf"
  "ScienceGothic-LtExpCtr-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-LtExpCtr.ttf"
  "ScienceGothic-Medium-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/static/Masters/ScienceGothic-Medium.ttf"

  "ScienceGothic[CTRS,slnt,wdth,wght]-$pkgver-${_commit::7}.ttf"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/fonts/variable/ScienceGothic%5BCTRS%2Cslnt%2Cwdth%2Cwght%5D.ttf"

  "$_fontname-$pkgver-${_commit::7}-LICENSE.txt"::"https://github.com/googlefonts/science-gothic/raw/${_commit}/OFL.txt"
)
sha256sums=('ac8006ddf5cc241c0e4f07fcaeaf07d8fa1313a3e5d8b0b8ef8a18c9a905becc'
            'f229f0fde71afa019134a040d3f4abf324294b2ad59dd7cabc584e0669bdf2b0'
            '156ca142f25b183980579fe943af2a1f1c3e07a17a164705b093effe8a379e51'
            '3570641097b680fe1e30e4d735acd5e01818b7881b09bcc84a3614e84b95aa18'
            '070d608c779868dc8d8476e6ee2f10773ded5c2162f9310b7e19cc6bbc8f31ec'
            '53b735c59b16f9fcc5eed1e0c70bdbef716e4bc576a3c374ea8db3243f056d5d'
            '1162b539d247b9d96b4abd4adcd93ba06874f45d48324b25ddbd45ced36f7c0e'
            '7c1cab74baca2e52f74776c0c1641ff75a4d32e1305983e3fe48c65c9172b5c0'
            '4ef025064182ffb1d2072a5019c80db2ac78e7d75436f2bbd3665b828556aab7'
            '1c63b306eaa1f6511610b18a61f62fb40276014f8dcbdd026ce99b5ad795a69b'
            '99c61c2e27df3a666b52729c1741360c0c3d42723881ba283374793ecc872ab7'
            '5556cd2f30415410c6f7773c1ccfcc47b9185611b739d6053aa30373c0af4db4'
            'c38dbc40cbb3eedb4bf532d2ee7b14f3179d83a8d012eba138bf3329928b9d21'
            '23324bfdcbf8b998cfd53aeadbe2388535d80abff92412dd7a5cc9f3af29c6b2'
            '59b4f00cc774746d7e802a2a5e9239dc7abc72a8165c0a5e23343e89fbb752da'
            '9456db434ce69fddb78d73559ac4b8fe67e2b739cbd422b0e3c25da86322cce6'
            '246e4d33a6fcb3846094e5c4c034616f83e9ae10100316df32e2436362deab3d'
            'f7f605ce3c63baa5533afdcf02278d604d9f981cf5a3270b021107f65f553c06')

package_ttf-science-gothic() {
  pkgdesc+=' (16 static cuts)'
  local _f _fonts=(
    ScienceGothic-Blk
    ScienceGothic-BlkCnd
    ScienceGothic-BlkCndCtr
    ScienceGothic-BlkCtr
    ScienceGothic-BlkExp
    ScienceGothic-BlkExpCtr
    ScienceGothic-CndCtr
    ScienceGothic-Ctr
    ScienceGothic-ExpCtr
    ScienceGothic-Lt
    ScienceGothic-LtCnd
    ScienceGothic-LtCndCtr
    ScienceGothic-LtCtr
    ScienceGothic-LtExp
    ScienceGothic-LtExpCtr
    ScienceGothic-Medium
  )

  for _f in "${_fonts[@]}"; do
    install -Dm644 "$_f-$pkgver-${_commit::7}.ttf" "$pkgdir/usr/share/fonts/$_fontname/$_f.ttf"
  done

  install -Dm644 "$_fontname-$pkgver-${_commit::7}-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-science-gothic-variable() {
  pkgdesc+=' (variable font)'
  install -Dm644 "ScienceGothic[CTRS,slnt,wdth,wght]-$pkgver-${_commit::7}.ttf" "$pkgdir/usr/share/fonts/$_fontname/ScienceGothic-Variable.ttf"
  install -Dm644 "$_fontname-$pkgver-${_commit::7}-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
