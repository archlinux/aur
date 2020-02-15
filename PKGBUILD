# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=ttf-sil-fonts
pkgver=8
pkgrel=2
pkgdesc="Metapackage depending on all OFL-licensed font packages from SIL"
arch=('any')
url='https://software.sil.org/fonts'
license=('custom:OFL')
_silfonts=('abyssinica'
           'alkalami'
           # 'andika' Blocked by AUR package
           'annapurna'
           'apparatus'
           'awami-nastaliq'
           # 'charis' Has different name in AUR
           'dai-banna'
           'doulos'
           'ezra'
           'galatia'
           'harmattan'
           'lateef'
           'mingzat'
           'mondulkiri'
           'namdhinggo'
           'nuosu'
           'padauk'
           'scheherazade'
           'sophia-nubian'
           'tagmukay'
           'tai-heritage-pro')
depends=('gentium-plus-font' 'ttf-charis-sil' "${_silfonts[@]/#/ttf-sil-}")

package() {
    :
}
