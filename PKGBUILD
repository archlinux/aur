pkgname=denix-scripts
pkgver=1.0
pkgrel=7
pkgdesc="DeniX scripts"
arch=("any")
url="https://github.com/denix666/denix-scripts"
license=('GPL')
source=("git+https://github.com/denix666/denix-scripts.git")
md5sums=('SKIP')

package() {
    cd ${srcdir}/${pkgname}
    install -D -m644 etc/profile.d/denix.sh ${pkgdir}/etc/profile.d/denix.sh
    install -D -m755 usr/bin/system-setup-samba ${pkgdir}/usr/bin/system-setup-samba
    install -D -m755 usr/bin/system-setup-fonts ${pkgdir}/usr/bin/system-setup-fonts
    install -D -m755 usr/bin/system-setup-fonts ${pkgdir}/usr/bin/system-setup-rc.local
    install -D -m755 usr/bin/system-setup-xfce4 ${pkgdir}/usr/bin/system-setup-xfce4
    install -D -m755 usr/bin/system-setup-vsftpd ${pkgdir}/usr/bin/system-setup-vsftpd
}
