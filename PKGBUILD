# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=adguardvpn-cli-bin
pkgver=1.1.126
pkgrel=4
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard-vpn.com/'

_file="adguardvpn-cli"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v${pkgver}-release/${_full_name}.tar.gz"
)
sha256sums=('d3d80f90d3f3289268eaab950c08a89d7fa0b86b2aa0104980b0220f69dcaf8a')

package() {
    install -D "${_full_name}/${_file}" "${pkgdir}/usr/bin/${_file}"
    install -D "${_full_name}/bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/bash-completion.sh"
}

