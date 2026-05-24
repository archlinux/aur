# Maintainer: Dr. Richard Kellnberger <aur@richardk2n.de>

pkgname='miktex-provides-texlive'
pkgdesc='Allows MiKTeX to fully replace TeX Live, without having the latter installed at all.'
pkgver=1.0
pkgrel=1
arch=(any)
depends=('miktex')
provides=(texlive-texmf texlive-doc texlive-meta)
conflicts=(texlive-texmf texlive-doc texlive-meta)
_collections=( basic bibtexextra binextra context fontsextra fontsrecommended fontutils formatsextra games humanities langarabic langchinese langcjk langcyrillic langczechslovak langenglish langeuropean langfrench langgerman langgreek langitalian langjapanese langkorean langother langpolish langportuguese langspanish latex latexextra latexrecommended luatex mathscience metapost music pictures plaingeneric pstricks publishers xetex )
for _coll in ${_collections[@]}; do
  provides+=(texlive-$_coll)
  conflicts+=(texlive-$_coll)
done
