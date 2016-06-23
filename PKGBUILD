# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='linux-source-el7-centos-plus'
pkgver='3.10.0'
pkgrel=1
pkgdesc='Last Linux Kernel source of RHEL7/Centos7'
arch=('x86_64')
url='https://centos.org'
license=('GPL')
options=(!strip)
source=('http://mirror.centos.org/centos/7/centosplus/x86_64/Packages/kernel-plus-devel-3.10.0-327.18.2.el7.centos.plus.x86_64.rpm')
sha256sums=('cd364d4f1335e2a2f3709ce5fee3a6dc63a3c25a8284171e258bcbd7a7a24395')


package() {
	    install -dm755 "${pkgdir}/usr/src/3.10.0-327.18.2.el7.centos.plus.x86_64/"
            cd "${srcdir}/usr/src/kernels/3.10.0-327.18.2.el7.centos.plus.x86_64/"
            cp -rf * "${pkgdir}/usr/src/3.10.0-327.18.2.el7.centos.plus.x86_64/"
}
