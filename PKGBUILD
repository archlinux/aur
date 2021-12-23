pkgname=gitgudcli-bin
_pkgname=gitgud-cli
pkgver=2.2.1
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

sha256sums_i686=('11090780112895e987f718fe84a4590e479efa9e540d93fc4418009c439ab335')
sha256sums_x86_64=('30bd6e0d88b2f461dbf96b902c0e00c202a72685300bcd8281689ef4832e1848')
sha256sums_aarch64=('3612f35a63cf847642b6e0bc60a3569696ef07862463a2dfa0bd57e25be44f40')

package() {
    install -Dm755 "${srcdir}/gitgud" "${pkgdir}/usr/bin/gitgud"
}
