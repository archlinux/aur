# Maintainer Harvard University FAS Research Computing <rchelp.fas.harvard.edu>

pkgname=one-context
pkgver=4.14.2
pkgrel=1
pkgdesc='OpenNebula Contextualisation'
arch=('any')
url='https://github.com/OpenNebula/addon-context-linux/releases'
license=('Apache')
depends=('mkinitcpio-growrootfs')
source=("https://github.com/OpenNebula/addon-context-linux/archive/v4.14.2.tar.gz")
install=one-context.install
md5sums=('54beb6af99d5d4746b63bb451510db95')

package() {
    cp -rT ${srcdir}/addon-context-linux-${pkgver}/base_arch ${pkgdir}
    cp -rT ${srcdir}/addon-context-linux-${pkgver}/base ${pkgdir}
    cp -rT ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
    rm ${pkgdir}/usr/sbin/one-contextd
    rmdir ${pkgdir}/usr/sbin
}