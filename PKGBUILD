# Maintainer: Javier Tia <floss@jetm.me>
_pkgname=difi
pkgname=difi-bin
pkgver=0.1.8
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
sha256sums_x86_64=('2dff8223457c7b12c5e3f881552d8db1cb757140f7b808ca3963ffdcb2352b25')
sha256sums_aarch64=('74ab8389758973a1ff8dbff8af620ac0013ec9c1109a642954fe12ae5c0801ad')

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
