# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=dell-drac-kvm-bin
pkgver=36.2ba7251
pkgrel=2
pkgdesc="Dell DRAC KVM Launcher (x86_64 binary)"
arch=('x86_64')
url="https://github.com/PaulMaddox/drac-kvm"
license=('GPL2')
depends=('icedtea-web')

# 32bit version not available as binary
# source_i686=(${url}/blob/master/binaries/drac.linux_32bit?raw=true)
source_x86_64=(${url}/blob/master/binaries/drac.linux_64bit?raw=true)

# sha256sums_i686=('0000000000000000000000000000000000000000000000000000000000000000'
sha256sums_x86_64=('87779f2176bf123338308b8f058ca63fdbcec329e1e68eb0a1dacd5a404b647b')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install -m 755 "${srcdir}/drac.linux_64bit?raw=true" "${pkgdir}/usr/bin/drac.linux_64bit"
    echo
    echo "#############################################################################"
    echo "# When running this prg please be patient as this stuff takes some seconds. #"
    echo "#############################################################################"
    echo
}
