# Maintainer: Felipe Morales <hel.sheep@gmail.com>

_pkgbase=rtl8723de
pkgname=rtl8723de-dkms
pkgver=1
pkgrel=1
pkgdesc="RTL8723 wireless + bluetooth modules (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/smlinux/rtl8723de"
license=('GPL2')
depends=('dkms')
source=("${url}/archive/4.11-up.zip")
md5sums=('812c453a8cdb851519ce5cda8f58c962')


package() {
    install -Dm644 "${srcdir}"/"${_pkgbase}"-4.11-up/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    cp -r "${srcdir}"/"${_pkgbase}"-4.11-up/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
