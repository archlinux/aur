# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.19.1
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
sha256sums_x86_64=('8ee5d1a2f2d33f8e62b81349b7bea36b9f08b8e76f30a09767c04ce9ccbc0a3d')
sha256sums_aarch64=('ab90869cb5e810457d92b7d6148982fcb0b5463e3161948d1fef27d208789cc6')
sha256sums_armv7h=('917e274d03e5feddbacefa37100e4b1944c0834d15ba3c585d55a1fcb75ab065')
sha256sums_armv6h=('d12c6d79e1ebd99fcd1e9c91a5c3d33eaa416b395c89ddcfcfd62e00d5602a89')
sha256sums_riscv64=('7f8a4071c9d26226ae69a3eea28d1b73faaf107a49be56a74e31dd9dd291018c')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
