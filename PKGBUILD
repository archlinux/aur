# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hoverfly-bin
pkgver=1.5.3
pkgrel=2
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://hoverfly.io'
_githuburl="https://github.com/SpectoLabs/hoverfly"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_arm64.zip")
source_i686=("${pkgname}-${pkgver}-i686.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_386.zip")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_amd64.zip")
sha256sums_aarch64=('4b5ac3f323fc3dc647db6f6220ceed2cdaca1e7b68075c78adfdee9c950e9a3d')
sha256sums_armv7h=('4b5ac3f323fc3dc647db6f6220ceed2cdaca1e7b68075c78adfdee9c950e9a3d')
sha256sums_i686=('f643eaba9dbb83e6fd65ad937fc6c7b7bc511ec835166973d09b14b945727ab0')
sha256sums_x86_64=('ac3fbc0fd210c5880f783bc76c81b0def635bb9d702f19d240198f4f9b7d5a17')
package() {
    install -Dm755 "${srcdir}/hoverctl" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}