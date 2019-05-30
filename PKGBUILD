# Maintainer: Nils Schäfer <n.schaefer@oxide.tu-darmstadt.de>
# Contributor: TU Darmstadt <service@hrz.tu-darmstadt.de>
pkgname=hessenbox-da
pkgver=11.5.625
pkgrel=1
pkgdesc='is a software to sync, share, backup,
 and access files.'
arch=('x86_64' 'i686')
license=('custom')
url='https://hessenbox.tu-darmstadt.de/'
_maintainer='TU Darmstadt <service@hrz.tu-darmstadt.de>'
depends=('jre-openjdk')
depends_x86_64=()
depends_i686=()
optdepends=()
options=()

source_x86_64=("${pkgname}-${pkgver}-Release::https://hessenbox.tu-darmstadt.de/client_deployment/HESSENBOX_DA_Latest_amd64.deb")
source_i686=("${pkgname}-${pkgver}-Release::https://hessenbox.tu-darmstadt.de/client_deployment/HESSENBOX_DA_Latest_i386.deb")
package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"
    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
md5sums_x86_64=('3d8be13c1c1b8fce1a9a3745d3305524')
md5sums_i686=('3d8be13c1c1b8fce1a9a3745d3305524')
