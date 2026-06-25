# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.10.2
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
sha256sums_x86_64=('9f97e4922ee24e1ae4d7dffbcd537e701abc8219826b419ab232f078ce3fa1af')
sha256sums_aarch64=('632ad698bc973fa6a2cfa38e95f380fa6da596bab9f4b04029cfdfadd6a1ce71')
sha256sums_armv7h=('1818c0eac811a1f35e547b6c994e0f20bacf8d1826242c4ae7bdc1ddb39090b6')
sha256sums_armv6h=('24aa456b176826a992f8907531ffbbb77fdb8df1728076921c81bdb481f1bbdc')
sha256sums_riscv64=('b82d145833e5ced1e8ced7f62d725082cbefe1704cb4a138b7001328ad584aa1')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
