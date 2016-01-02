# Maintainer: Laurent Treguier <laurent@treguier.org>
pkgname=dkms-autoremove
pkgver=1.0.0
pkgrel=1
pkgdesc='Script and service to remove unused kernel modules built using DKMS'
arch=('any')
url='https://aur.archlinux.org/packages/dkms-autoremove'
license=('MIT')
depends=('dkms')
source=("$pkgname.tar.gz")
md5sums=('44dfac3ac1ec36eae6def0bb551e47e2')

package() {
    cd "$pkgname"
    install -Dm 755 dkms-autoremove "${pkgdir}/usr/bin/dkms-autoremove"
    install -Dm 644 dkms-autoremove.service "${pkgdir}/usr/lib/systemd/system/dkms-autoremove.service"
}
