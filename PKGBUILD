# Maintainer: Laurent Treguier <laurent@treguier.org>
pkgname=dkms-autoremove
pkgver=1.0.3
pkgrel=1
pkgdesc='Script and service to remove unused kernel modules built using DKMS'
arch=('any')
url='https://aur.archlinux.org/packages/dkms-autoremove'
license=('MIT')
depends=('dkms')
source=($pkgname{,.service})
md5sums=('d18bee429dbbc3519d212b7b077ebf07'
         'd8e77f151e20861378f4c0b5f835b6ea')

package() {
    cd "$srcdir"
    install -Dm 755 dkms-autoremove "$pkgdir/usr/bin/dkms-autoremove"
    install -Dm 644 dkms-autoremove.service "$pkgdir/usr/lib/systemd/system/dkms-autoremove.service"
}
