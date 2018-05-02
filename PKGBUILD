# Maintainer: eomanis at web dot de

pkgname='disk-test'
pkgver=0.1.0
pkgrel=3
pkgdesc="Block device read-write test utility"
arch=('any')
url='http://eomanis.mooo.com/permshare/disk-test/index.html'
license=('GPL3')
depends=('bash' 'coreutils' 'openssl' 'pv' 'diffutils' 'grep' 'util-linux')
source=("http://eomanis.mooo.com/permshare/disk-test/disk-test-${pkgver}.tar.gz")
sha256sums=('3470325447ce43492eb8b085e45a4bc5ac6899b76c428922d8379dcb75732117')

package() {
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/disk-test"
    chmod u=rwx,go=rx "disk-test"
}
