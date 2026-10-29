# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=see-cli-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Command-line client for the S.EE content sharing platform (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/sdotee/cli"
license=('MIT')
provides=('see-cli')
conflicts=('see-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/sdotee/cli/releases/download/v${pkgver}/see_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/sdotee/cli/releases/download/v${pkgver}/see_Linux_arm64.tar.gz")
sha256sums_x86_64=('0f24152bf887bcd011096351840c703b5ad454c94decd3887a0601ba34dd2c64')
sha256sums_aarch64=('7575c5e1b0bb8f2aded921edcc0cdd74a51a858acda753993cbb54ae01481a29')

package() {
    install -Dm755 see "${pkgdir}/usr/bin/see"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

