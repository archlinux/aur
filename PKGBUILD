# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: farnsworth517 <hikmet1517[at]gmail[dot]com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: <cheesinglee@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=ttf-sil-fonts
pkgver=7
pkgrel=1
pkgdesc="Metapackage depending on all OFL-licensed font packages from SIL"
arch=('any')
url='https://software.sil.org/fonts'
license=('custom:OFL')
_silfonts=('abyssinica'
           # 'andika' Blocked by AUR package
           'annapurna'
           'apparatus'
           # 'charis' Blocked by AUR package
           'doulos'
           'dai-banna'
           'ezra'
           'galatia'
           'lateef'
           'nuosu'
           'padauk'
           'scheherazade'
           'sophia-nubian'
           'tai-heritage-pro')
depends=('gentium-plus-font' "${_silfonts[@]/#/ttf-sil-}")

package() {
    :
}
