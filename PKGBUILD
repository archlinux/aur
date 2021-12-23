pkgname=gitgudcli-bin
_pkgname=gitgud-cli
pkgver=2.2.0
pkgrel=1
pkgdesc='An easy to use CLI for the GitGud modular Git model.'
url="https://github.com/HRKings/${_pkgname}"
license=('unknown')
provides=(gitgudcli)
conflicts=(gitgudcli)
arch=('aarch64' 'i686' 'x86_64')

source_x86_64=("${url}/releases/download/${pkgver}/gitgud_v${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/${pkgver}/gitgud_v${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/gitgud_v${pkgver}_linux_arm64.tar.gz")

sha256sums_aarch64=('0ef116929555035cfc463de583a31935e3e8ce6b820b69fca3eb93b48e4dbebf')
sha256sums_i686=('627a2686cf7209e649b76cb5fa81fa8612db189ea2bc41b5cfc82586a76531b9')
sha256sums_x86_64=('eab110a4e45fce221b00b143797abb50e3771703ab4541ba25cfbd374a59b5af')

package() {
    install -Dm755 "${srcdir}/gitgud" "${pkgdir}/usr/bin/gitgud"
}
