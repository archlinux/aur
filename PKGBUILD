pkgname=gitgudcli-bin
_pkgname=gitgud-cli
pkgver=2.2.2
pkgrel=1
pkgdesc='An easy to use CLI for the GitGud modular Git model.'
url="https://github.com/HRKings/${_pkgname}"
license=('unknown')
provides=(gitgudcli)
conflicts=(gitgudcli)
arch=('aarch64' 'i686' 'x86_64')

source_i686=("${url}/releases/download/${pkgver}/gitgud_v${pkgver}_linux_386.tar.gz")
source_x86_64=("${url}/releases/download/${pkgver}/gitgud_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/gitgud_v${pkgver}_linux_arm64.tar.gz")

sha256sums_i686=('c62805af8a0a3731f9ffbe7ddf34d124644588229648e16d4b50c85b110b1d2f')
sha256sums_x86_64=('c1a73bbdeeab3b4a951beabfc57a06a119e3a125674739f5b36e5a4471651bb6')
sha256sums_aarch64=('8868feda5a02b617923284927dab26a6105d6629b606ee99e152d0fcc8e9243c')

package() {
    install -Dm755 "${srcdir}/gitgud" "${pkgdir}/usr/bin/gitgud"
}
