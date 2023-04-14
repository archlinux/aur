# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=ttf-sil-fonts
pkgver=9
pkgrel=1
pkgdesc='Metapackage depending on all OFL-licensed font packages from SIL'
arch=(any)
url=https://software.sil.org/fonts
license=(OFL)
_silfonts=(abyssinica
           alkalami
           annapurna
           apparatus
           awami-nastaliq
           dai-banna
           doulos
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
depends=(gentium-plus-font
        ttf-charis-sil
        ttf-andika
        ttf-scheherazade-new
        "${_silfonts[@]/#/ttf-sil-}")

package() {
    :
}
