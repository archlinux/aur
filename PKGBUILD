# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Firmicus <francois.archlinux.org>

pkgname=ttf-freebanglafont
pkgver=20130212
pkgrel=3
pkgdesc='Bengali fonts'
url='http://www.ekushey.org/'
license=('GPL')
arch=('any')
depends=('xorg-fonts-encodings' 'xorg-font-utils' 'fontconfig')

package() {
  cd ttf-freebanglafont
  for i in *.ttf; do
    install -Dm644 "${i}" "${pkgdir}"/usr/share/fonts/TTF/${i}.ttf
  done
}

_fonts=('solaimanlipi'
        'rupali'
        'ekushey_lohit'
        'ekushey_sharifa'
        'ekushey-punarbhaba'
        'ekushey_sumit'
        'ekushey-durga'
        'ekushey_Saraswatii'
        'ekushey_puja'
        'ekushey_azad'
        'ekushey_godhuli'
        'ekushey_mohua'
        '16-december'
        'amar-bangla'
        'amar-desh'
        'bangla-kolom'
        'buriganga'
        'ekushey-bangla'
        'ekushey-kolom'
        'ekushey-sumon'
        'ghorautra'
        'lal-sabuj'
        'lal-sabuj-normal'
        'lal-salu'
        'preview-sornaly'
        'preview-mukto'
        'preview-shimanto'
        'preview-ananta')

#source=($(for i in ${_fonts[@]}; do curl -s http://ekushey.org/?page/$i | sed -e 's/"/\n/g' | grep 'http:.*.ttf'; done))

source=(https://sources.archlinux.org/other/packages/${pkgname}/ttf-freebanglafont-20130212-2.src.tar.gz)
sha256sums=('19a85c6b76e1b3bff3864485a40724fad7c1224a5e20960be08e31659b91e502')
