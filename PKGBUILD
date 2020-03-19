# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=ttf-sil-fonts
pkgver=8
pkgrel=3
pkgdesc='Metapackage depending on all OFL-licensed font packages from SIL'
arch=('any')
url='https://software.sil.org/fonts'
license=('OFL')
_silfonts=('abyssinica>=2.000-5'
           'alkalami'
           # 'andika' Has different pkgname format in AUR
           'annapurna'
           'apparatus'
           'awami-nastaliq'
           # 'charis' Has different pkgname format in AUR
           'dai-banna'
           'doulos'
           'ezra'
           'galatia'
           # 'gentium-plus' Has pkgname format in [community]
           'harmattan'
           'lateef>=1.200-7'
           'mingzat'
           'mondulkiri'
           'namdhinggo'
           'nuosu'
           'padauk'
           'scheherazade'
           'sophia-nubian'
           'tagmukay'
           'tai-heritage-pro')
depends=('gentium-plus-font' 'ttf-charis-sil>=5.000-3' 'ttf-andika>=5.000-4' "${_silfonts[@]/#/ttf-sil-}")

package() {
    :
}
