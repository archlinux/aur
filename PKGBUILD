# Maintainer: eomanis at web dot de

pkgname='disk-test'
pkgver=0.1.1
pkgrel=2
pkgdesc="Block device read-write test utility"
arch=('any')
url='https://eomanis.duckdns.org/permshare/disk-test/index.xhtml'
license=('GPL3')
depends=('bash' 'coreutils' 'openssl' 'pv' 'diffutils' 'grep' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/disk-test/disk-test-${pkgver}.tar.gz")
sha384sums=('5ccea4af83191bcff48b8440c6da8d10f9874fdc396b8f197ad400c759a8b98f0c163b917527bbe17b5556e317182047')

package() {
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/disk-test"
    chmod u=rwx,go=rx "disk-test"
}
