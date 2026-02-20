# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_pkgname=difi
pkgname=difi-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Review and refine Git diffs before you push'
arch=('x86_64' 'aarch64')
url='https://github.com/oug-t/difi'
license=('MIT')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/difi_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/difi_Linux_arm64.tar.gz")
sha256sums_x86_64=('3ad7e0008cd93f37d3da81e5dcd7becf6afc47c3496bf258bbdfde28a49fff75')
sha256sums_aarch64=('0905e780cb1b1286acc73a08d8053aac7074b958c393c9ec04057c880069c4ee')

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
