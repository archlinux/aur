# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="gitern"
pkgver=1.1.0
pkgrel=1
pkgdesc="a git host for hackers"
arch=("any")
url="https://gitern.com"
license=("MIT")
optdepends=("bash-completion: Bash completion")
source=("https://files.gitern.com/${pkgname}"
        "completion")
sha512sums=("2280470d6c824d2cba8d2121f6c4119198f499e9d8d171e1066a9d784fc8886a9b3538f3349b301a3cd57b2550e26e419903ec03c8cc7695b9c7bf8f799fa488"
            "7a2151606a8f7d7c9021d3c4c76748cad2a6c381a2de561a1db521a0275da53e0a7b45a18e3755bd25c0684a952a01dd064d83e2a60d090b81543010497b8f00")

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
