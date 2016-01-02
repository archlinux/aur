# Maintainer: Laurent Treguier <laurent@treguier.org>
pkgname=dkms-autoremove
pkgver=1.0.1
pkgrel=1
pkgdesc='Script and service to remove unused kernel modules built using DKMS'
arch=('any')
url='https://aur.archlinux.org/packages/dkms-autoremove'
license=('MIT')
depends=('dkms')
source=($pkgname{,.service})
md5sums=('966b3ea060cba8d6365931fbe50bcd75'
         'd8e77f151e20861378f4c0b5f835b6ea')

package() {
    cd "$srcdir"
    install -Dm 755 dkms-autoremove "$pkgdir/usr/bin/dkms-autoremove"
    install -Dm 644 dkms-autoremove.service "$pkgdir/usr/lib/systemd/system/dkms-autoremove.service"
}
