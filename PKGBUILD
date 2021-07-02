# Miantainer : Yamada Hayao <hayao@fascode.net>
# Contributer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=vmware-auto-unlocker
pkgver=1.1.3
pkgrel=1
pkgdesc="Unlocker for VMWare macOS"
arch=('x86_64')
url="https://github.com/paolo-projects/auto-unlocker/"
license=('GPL3')
depends=('curl' 'libarchive')
source=("git+https://github.com/paolo-projects/auto-unlocker.git#tag=v${pkgver}")
sha512sums=('SKIP')

build(){
    cd "${srcdir}/auto-unlocker"
    make
}

package() {
    cd "${srcdir}/auto-unlocker"
    make PREFIX="${pkgdir}/usr" install
}
