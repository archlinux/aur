# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.8.0
pkgrel=4
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
sha256sums_x86_64=('9ab93a684bfb52ed0ffb1686fd64afbdb0aac0b0e10ce3fae3f1249f0c96f785')
sha256sums_aarch64=('5d1cc86bf16a493e3e6a1790e343431bf4d4a2722e1f810a2003d88e92371b09')
sha256sums_armv7h=('507b95da62d85250ef549a96c90dabae1aaffb10c281bf37eb4050afe6e7eaa4')
sha256sums_armv6h=('05cc3d28879da8dab76de928517429817b0fd0601a572fc0edb8e6c4b388ad6f')
sha256sums_riscv64=('097468d580ee67755e14b8bc2f95a4032f3564e16c3f2e91a653b79d7a240078')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
