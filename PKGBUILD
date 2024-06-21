# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=keyring-cli-bin
pkgdesc="A very basic cli keyring tool to use accross various OS."
pkgver=1.0.2
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/vbouchaud/keyring"
license=('MPL2')
conflicts=('keyring-cli')
provides=('keyring-cli')

sha256sums_x86_64=(
    b8d5e9483f41b2044b27d30c2b423b925fb31088a4b1c70e99b1cf2ee2128364
)
sha256sums_aarch64=(
    ed812d242c1fba74d526b903344fb8310904800c0e97ecd1d7fd46e1f5d62924
)

source_x86_64=(
    "keyring::https://github.com/vbouchaud/keyring/releases/download/v${pkgver}/keyring.linux.amd64"
)
source_aarch64=(
    "keyring::https://github.com/vbouchaud/keyring/releases/download/v${pkgver}/keyring.linux.arm64"
)

package() {
    install -D -m0755 "${srcdir}/keyring" "${pkgdir}/usr/bin/kc"
}
