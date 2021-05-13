# Maintainer: malacology
# Contributor: malacology

pkgname=dnastar7activated
pkgver=7.1.0
pkgrel=1
pkgdesc="leader in the field of bioinformatics software, including SeqMan Editseq GeneQuest Megalign PrimerSelect Protean SeqBuilder"
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
         '20cf16c0ef7fa8eda9246025aab9c6c3'
         '325d372e1abc9b640c390623413c207e'
         '57df660e83f733b81478123e1cd82444'
         '54a16c1895eb6cd7cb45f46a3b1219dc'
         '3f35142796dec237ffe2184d729af598'
         '6e10ab6b4265b8e182d0ed21f6e9e838'
         'd62b639cff7a76c0582c6eb5fb42821a'
         '04e48add541da69cf663cfcc03018876'
         '94d9d61cae2a69069f0b4d28e238b629'
         '18f059e6bccf85ee68f1e80833aca086'
         '4ba2031910170c2ab76b990bb8e8c39e'
         'a6c6d2ecd5cdb6d9fbb88a09a4808b6e'
         '776651e49951bba1afc4dbe7a452bbaa')

package() {
  install -dm755 "$pkgdir"/usr/share/{dnastar,applications}
  mv "$srcdir"/DNASTAR/* "$pkgdir"/usr/share/dnastar
  install -D -m 755 ${srcdir}/*.png "${pkgdir}/usr/share/dnastar"
  install -D -m 755 ${srcdir}/*.desktop "${pkgdir}/usr/share/applications"
}
