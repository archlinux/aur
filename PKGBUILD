# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=adguardvpn-cli-bin
pkgver=1.1.126
pkgrel=1
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard-vpn.com/'

source=(
	"adguardvpn-cli_${pkgver}::https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v${pkgver}-release/adguardvpn-cli-${pkgver}-linux-${arch}.tar.gz"
)
sha256sums=('d3d80f90d3f3289268eaab950c08a89d7fa0b86b2aa0104980b0220f69dcaf8a')

package() {
    install -m 755 -D -t "${pkgdir}/usr/bin/" adguardvpn-cli
}

