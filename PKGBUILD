# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
# Contributor: CToID <funk443@yahoo.com.tw>
pkgname=ttf-tw-edu-kai
pkgver=5.1
pkgrel=1
pkgdesc='The regular script style (aka kai style) font for Tradtional Chinese.'
arch=('any')
url='https://language.moe.gov.tw/material/info?m=9fe3fe82-8bbf-44c0-961d-873ea079e284'
license=('CC-BY-ND-4.0')
source=("https://language.moe.gov.tw/uploads/files/17694979891080.zip")
sha256sums=('0cc23456a8bbf639133ee88da7430a9dfe8519ba1f8e4e4b6dce1ab4180435cb')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 edukai*.ttf ${pkgdir}/usr/share/fonts/TTF/edukai.ttf
}
