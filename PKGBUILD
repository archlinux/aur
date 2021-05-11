# Maintainer: malacology
# Contributor: malacology

pkgname=dnastar7activated
pkgver=7.1.0
pkgrel=1
pkgdesc="leader in the field of bioinformatics software, pioneering innovative software solutions since 1984"
arch=('any')
url="https://github.com/starsareintherose/dnastar"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://github.com/starsareintherose/DNASTAR/releases/download/${pkgver}/DNASTAR.zip" "Editseq.png" "Editseq.desktop" "GeneQuest.png" "GeneQuest.desktop" "Megalign.png" "Megalign.desktop" "PrimerSelect.png" "PrimerSelect.desktop" "Protean.png" "Protean.desktop" "SeqBuilder.png" "SeqBuilder.desktop" "SeqMan.png" "SeqMan.desktop")
md5sums=('5472de76f406b25e61f4b58ecfe49678'
         '28e564f259eeab7be458527847d68139'
         '6b920677a10049facdcde33822cdb1e3'
         '325d372e1abc9b640c390623413c207e'
         '5c0c2a762b3ba422c9ddad93c8a2932b'
         '54a16c1895eb6cd7cb45f46a3b1219dc'
         '80b9a179638f4caae87229992802ba2e'
         '6e10ab6b4265b8e182d0ed21f6e9e838'
         '013575d45298bca28adf30765a0a8a16'
         '04e48add541da69cf663cfcc03018876'
         '518ac25c9dff4e33f287e304c13003b2'
         '18f059e6bccf85ee68f1e80833aca086'
         '209f980c022584ec742ffd7a3153e391'
         'a6c6d2ecd5cdb6d9fbb88a09a4808b6e'
         '26ddf398aac1b2a1a5f409341a3a2cf2')

package() {
  install -dm755 "$pkgdir"/usr/share/{dnastar,applications}
  mv "$srcdir"/DNASTAR/* "$pkgdir"/usr/share/dnastar
}
