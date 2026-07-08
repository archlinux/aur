# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.13.0
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
sha256sums_x86_64=('2b223211b8c786050674fe6c88383380d0d5a38923d4d208eb5259437e3cfef4')
sha256sums_aarch64=('5f13fad1c6a3bcd9250fe863f281fccf4b4536fe7bb8633c7dd397f937636dcf')
sha256sums_armv7h=('e4c3f3a975a63d332c9fc7e54c452435344bf18c2fda3eb6c166825158da7941')
sha256sums_armv6h=('e6dba7f3b0431346be51cd3a9a1f60b90d427f7a0c224b5e90c1766ed9142de3')
sha256sums_riscv64=('033b216bbfac24b8465c82c897dd70e22f2507864332108f3c2f504b807d8e8e')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
