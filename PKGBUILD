# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=see-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command-line client for the S.EE content sharing platform (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/sdotee/cli"
license=('MIT')
provides=('see-cli')
conflicts=('see-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/sdotee/cli/releases/download/v${pkgver}/see_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/sdotee/cli/releases/download/v${pkgver}/see_Linux_arm64.tar.gz")
sha256sums_x86_64=('3d7f2fdb51c8c9fee0067a9b0001a6064c8b2887ff2063b34972f321cd19b7c9')
sha256sums_aarch64=('b0b94e9fd7d5fb964ee70844d88314a02d8a1ec6bd59896ef3b33102ef0f6c98')

package() {
    install -Dm755 see "${pkgdir}/usr/bin/see"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

