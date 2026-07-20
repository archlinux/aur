# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.15.0
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
sha256sums_x86_64=('3c8541a3294f4a078bbbfb1e48e1250ac5fa61a6ff12d48b13ce726e93d76eb9')
sha256sums_aarch64=('1842a83c11b60a24edf6f84b187e955fe74f12ce419fe9cf414f32beaf6ca8de')
sha256sums_armv7h=('a49bd8bf0fa25f8b961378393c76cbedcfc61671d3fcc14c664548abc0aa481f')
sha256sums_armv6h=('138d81e16c88a97f448cc493be49f5bd92cf05eb57f1d25aa6c659364047a34f')
sha256sums_riscv64=('97cb20e8040b5ff0c0de093d6c3aaed6d716d7258fe79e3252bebfce795ec4e3')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
