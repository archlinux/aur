# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=ttf-sil-fonts
pkgver=11
pkgrel=1
pkgdesc='Metapackage depending on all OFL-licensed font packages from SIL'
arch=(any)
url=https://software.sil.org/fonts
license=(OFL-1.1-RFN)
_ttffonts=(andika
           charis-sil
           doulos-sil
           gentium-plus
           scheherazade-new)
_silfonts=(abyssinica
           alkalami
           annapurna
           apparatus
           awami-nastaliq
           dai-banna
           ezra
           galatia
           harmattan
           lateef
           mingzat
           mondulkiri
           namdhinggo
           nuosu
           padauk
           sophia-nubian
           tagmukay
           tai-heritage-pro)
depends=("${_fonts[@]/#/ttf-}"
         "${_silfonts[@]/#/ttf-sil-}")

package() {
    :
}
