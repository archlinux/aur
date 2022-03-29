# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=keyring-cli-bin
pkgdesc="A very basic cli keyring tool to use accross various OS."
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/vbouchaud/keyring"
license=('MPL2')
conflicts=('keyring-cli')
provides=('keyring-cli')

sha256sums_x86_64=(
    caa1ea5a9a19cae2b718f13a25a84cee2a0af50760382590d009f0dbb961bcc7
)
sha256sums_aarch64=(
    c74f58e3dfb751412857e444a6a5e40dd78529ab379874be9dea52500d95a52f
)

source_x86_64=(
    "keyring::https://github.com/vbouchaud/keyring/releases/download/v${pkgver}/keyring.linux.amd64"
)
source_aarch64=(
    "keyring::https://github.com/vbouchaud/keyring/releases/download/v${pkgver}/keyring.linux.arm64"
)

package() {
    install -D -m0755 "${srcdir}/keyring" "${pkgdir}/usr/bin/keyring"
}
