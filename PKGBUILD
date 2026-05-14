# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.8.2
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
sha256sums_x86_64=('1e02b49139bd3cf1ec484d3b2514309a6cd68a2a4e1df7c91e926e38218268e7')
sha256sums_aarch64=('047f2a024af9f9c4a70dc419d54d11df49ee88f1a7e8667e8d4a434b8f818551')
sha256sums_armv7h=('b8b84a9bbe9d2f07b544b0b098c5180f31f894e3c082cd802c812b560138c95d')
sha256sums_armv6h=('4d3736b1bdee2e8ced7d34c1e72d01abf5f71f0f92ad4e4b0b44adfe567893e8')
sha256sums_riscv64=('87be0db1634fc5c795f0f1243115018ee38a7b7341948ce9380d417ca5fe9903')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
