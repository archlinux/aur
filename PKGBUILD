# Maintainer: eomanis at web dot de

pkgname='disk-test'
pkgver=0.1.1
pkgrel=1
pkgdesc="Block device read-write test utility"
arch=('any')
url='http://eomanis.mooo.com/permshare/disk-test/index.xhtml'
license=('GPL3')
depends=('bash' 'coreutils' 'openssl' 'pv' 'diffutils' 'grep' 'util-linux')
source=("http://eomanis.mooo.com/permshare/disk-test/disk-test-${pkgver}.tar.gz")
sha256sums=('2d29fad03449a4df8926bb790641ebb7f3625f9f884b1579365e9eff673e441c')

package() {
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/disk-test"
    chmod u=rwx,go=rx "disk-test"
}
