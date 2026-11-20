# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.23.0
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
sha256sums_x86_64=('f947176b6c8721928a45ccfb0152bacd3b4b75c6f212da0292efb7799947d87c')
sha256sums_aarch64=('bb5930cad86bd840bec67597194b83c717c7e9c11dfe851ab16ab65adde64711')
sha256sums_armv7h=('9b4349d983d8145fc73b59067fa79c810c7c67643b8946a9bbd9230a329555ab')
sha256sums_armv6h=('16431726a32bb2ab600316a3b69be2f9dfa2d5d43d0285e3d1942255a285978e')
sha256sums_riscv64=('ee59bb9799fe654a3aa54508064035c7592d589d81fe49cffc8eb2523c8302ff')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
