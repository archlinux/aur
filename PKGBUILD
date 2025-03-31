# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=adguardvpn-cli-bin
pkgver=1.2.37
pkgrel=1
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard-vpn.com/'

_file="adguardvpn-cli"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v${pkgver}-release/${_full_name}.tar.gz"
)
sha256sums=('f885d77ce0542f34b58ffd2a8f970ac7255ef6a7defec83ac93c86b4d27ec5c7')

package() {
    install -D "${_full_name}/${_file}" "${pkgdir}/usr/bin/${_file}"
    install -D "${_full_name}/bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/bash-completion.sh"
}

