# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=adguardvpn-cli-bin
pkgver=1.0.0
pkgrel=2
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard-vpn.com/'

source=(
	"adguardvpn-cli_${pkgver}::https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v${pkgver}-release/adguardvpn-cli-${pkgver}-linux-${arch}.tar.gz"
)
sha256sums=('332e6e5f14232a7ec96e4a5411ec9c0637b83d5e9a72a6f1a6666c010d0403a7')

package() {
    #mv "mirrord_${pkgver}" mirrord
    install -m 755 -D -t "${pkgdir}/usr/bin/" adguardvpn-cli
    #rm -f mirrord
}

