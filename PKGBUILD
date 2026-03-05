# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=see-cli-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Command-line client for the S.EE content sharing platform (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/sdotee/cli"
license=('MIT')
provides=('see-cli')
conflicts=('see-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/sdotee/cli/releases/download/v${pkgver}/see_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/sdotee/cli/releases/download/v${pkgver}/see_Linux_arm64.tar.gz")
sha256sums_x86_64=('ef0ff8e41579a828db303585e6711bf599619b3e0929b15e7616ed446647db90')
sha256sums_aarch64=('52a6370c01d3a406edc2d9f164a8c1b74b6676fb2e0630b3d75f10e3dfb695ca')

package() {
    install -Dm755 see "${pkgdir}/usr/bin/see"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

