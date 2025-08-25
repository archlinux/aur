# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=adguardvpn-cli-bin
pkgver=1.5.10
pkgrel=1
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard-vpn.com/'

_file="adguardvpn-cli"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v${pkgver}-release/${_full_name}.tar.gz"
)
sha256sums=('0a6df9940e94b914426ee6aa2e83a95566a0f59683a1a864e2910ed0c9574d2e')

package() {
    install -D "${_full_name}/${_file}" "${pkgdir}/usr/bin/${_file}"
    install -D "${_full_name}/bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/bash-completion.sh"
}

