# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=rdapcheck-bin
_pkgname=rdapcheck
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple RDAP library and command-line tool to check domain name availability in bulk."
arch=('x86_64' 'aarch64')
url="https://github.com/Gadiguibou/rdapcheck"
license=('AGPL-3.0')
options=('!strip')
provides=('rdapcheck')
conflicts=('rdapcheck')
source=("${url}/releases/download/v${pkgver}/rdapcheck-x86_64-unknown-linux-gnu"
        "${url}/raw/refs/heads/main/LICENSE")
sha256sums=('9ed5154b780a2c84e37a86e2e3e5fca83d2b498aa0c7e52d48456861aa9dd0a4'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

package() {
    install -Dm755 "${_pkgname}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
