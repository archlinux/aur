# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.18.1
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
sha256sums_x86_64=('07ae60ba0da7f3d25da6b78b76f0f2f40069605c2c52340f2f364e3cef72053f')
sha256sums_aarch64=('27a0ce04bb23bff83ed51638902034577ae71f460fe9a01ae0d0de035eb10118')
sha256sums_armv7h=('05b4fffbed974e39d83192069b3621f513bae7697994b28f410a980fafc2d98f')
sha256sums_armv6h=('ff6a39f8e271d5bc6b65f92f76a1ff468eb1e6696fdd29d1ba68c93a1003d84c')
sha256sums_riscv64=('c363fa69da00c228b575a7bab8f175a946ada972813eab285fddb3b0edf4bc8a')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
