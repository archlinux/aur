# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Pangolin Client - Secure reverse proxy and tunnel (Binary version)"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://github.com/fosrl/cli"
license=('AGPL-3.0-or-later')
provides=('pangolin')
conflicts=('pangolin')
install=pangolin-bin.install

source_x86_64=("pangolin::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_amd64")
source_aarch64=("pangolin::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_arm64")
source_armv7h=("pangolin::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_arm32")
source_armv6h=("pangolin::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_arm32v6")
source_riscv64=("pangolin::https://github.com/fosrl/cli/releases/download/${pkgver}/pangolin-cli_linux_riscv64")

# SHA256 Checksums (Generate these using 'updpkgsums')
sha256sums_x86_64=('9ab93a684bfb52ed0ffb1686fd64afbdb0aac0b0e10ce3fae3f1249f0c96f785')
sha256sums_aarch64=('9ab93a684bfb52ed0ffb1686fd64afbdb0aac0b0e10ce3fae3f1249f0c96f785')
sha256sums_armv7h=('9ab93a684bfb52ed0ffb1686fd64afbdb0aac0b0e10ce3fae3f1249f0c96f785')
sha256sums_armv6h=('9ab93a684bfb52ed0ffb1686fd64afbdb0aac0b0e10ce3fae3f1249f0c96f785')
sha256sums_riscv64=('9ab93a684bfb52ed0ffb1686fd64afbdb0aac0b0e10ce3fae3f1249f0c96f785')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin" "${pkgdir}/usr/bin/pangolin"
}
