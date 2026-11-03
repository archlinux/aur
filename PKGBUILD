# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Pangolin Client - Secure reverse proxy and tunnel (Binary version)"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://github.com/fosrl/cli"
license=('AGPL-3.0-or-later')
provides=('pangolin')
conflicts=('pangolin')
install=pangolin-bin.install

source_x86_64=("pangolin-${pkgver}::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_amd64")
source_aarch64=("pangolin-${pkgver}::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_arm64")
source_armv7h=("pangolin-${pkgver}::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_arm32")
source_armv6h=("pangolin-${pkgver}::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_arm32v6")
source_riscv64=("pangolin-${pkgver}::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_riscv64")


# SHA256 Checksums (Generate these using 'updpkgsums')
sha256sums_x86_64=('2af7c8263871ebabde51b2e5b95249085b8827dde3f27c940509ce3fa74d471e')
sha256sums_aarch64=('4eda576506895a9b271377759fe416e00bdcf815cd5bd9056ea67dc38265705d')
sha256sums_armv7h=('eac3c6ba3178630f79114512dbf7e073613933c187a6fd92f8e254c1f5ffe836')
sha256sums_armv6h=('e63b769f40343c3ab3279f13de35e9aac092dcfe1118104d7d6d327c88333411')
sha256sums_riscv64=('4232c8f4ffbce5d0876378f9da40ef750d692787a6ea50630718f5b61a6103ed')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
