# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=adguardvpn-cli-bin
pkgver=1.6.24
pkgrel=1
pkgdesc='Fast, flexible and reliable VPN solution for command-line enthusiasts.'
arch=('x86_64')
url='https://adguard-vpn.com/'

_file="adguardvpn-cli"
_full_name="${_file}-${pkgver}-linux-${arch}"

source=(
	"https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v${pkgver}-release/${_full_name}.tar.gz"
)
sha256sums=('7fa79c65e200f9494fd9315d2262c690003ca810b2d4d2fc9e211fb787e09b7f')

package() {
    install -D "${_full_name}/${_file}" "${pkgdir}/usr/bin/${_file}"
    install -D "${_full_name}/bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/bash-completion.sh"
}

