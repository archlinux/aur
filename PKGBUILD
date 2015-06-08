# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Great Contributor: Oliver Chang

pkgname=catalyst-fix-gdm
pkgver=14.12
pkgrel=2
pkgdesc="Workaround for GDM on AMD Catalyst. Based on a work of Oliver Chang - tl;dr version"
arch=('i686' 'x86_64')
url="https://oliverchang.github.io/2014/12/22/fixing-linux-amd-catalyst-linux-drivers-gdm/"
depends=('catalyst-utils' 'binutils' 'sed' 'grep')
install=${pkgname}.install


source=(catalyst-fix-gdm.service)

md5sums=('8d15ce1bf0e537e0afe289b566bbff78')


package() {
    # systemd service to put Xorg.bin version to the temp file
      install -m755 -d ${pkgdir}/usr/lib/systemd/system
      install -m644 ${srcdir}/catalyst-fix-gdm.service ${pkgdir}/usr/lib/systemd/system
}