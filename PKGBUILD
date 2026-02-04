# Maintainer: Javier Tia <javier dot tia at gmail dot com>
_pkgname=difi
pkgname=difi-bin
pkgver=0.1.0
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
sha256sums_x86_64=('f5f46cb621b630f331b8adc6d44ee250bc43ed0d700c1a34ae12a81ca3f81503')
sha256sums_aarch64=('9f5d35a17475768c8ca2fcae96294c325ba6c36a93378c2a6e8be1fe64716751')

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
