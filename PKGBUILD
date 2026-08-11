# Maintainer: vbopk9x3 <vbopk9x3@4wrd.cc>
pkgname=pangolin-bin
pkgver=0.15.1
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
sha256sums_x86_64=('91b6a66af9da52152e49963af802f044c96e7b20e1e0299884ed951313aa9cb1')
sha256sums_aarch64=('a82def973202317acfc7360c1a42ee54a29912a0462818e1b78661ff5ff76f75')
sha256sums_armv7h=('51cc0416ce8c8284fd80fb88f3ee8882840139a18d61c8760919adc1241dfa19')
sha256sums_armv6h=('c66053122c29f8042fb4d27f4e9126b77ff5b29d5ddb96c60e8d6d182d702d41')
sha256sums_riscv64=('616730cfb99eed6ffa22bac08e566c34191a1322e0a034da0291d9ca3616165f')

package() {
    # Install the binary to /usr/bin and set executable permissions
    install -Dm755 "${srcdir}/pangolin-${pkgver}" "${pkgdir}/usr/bin/pangolin"
}
