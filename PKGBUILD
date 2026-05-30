# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=prismcli
pkgver=1.2
pkgrel=1
pkgdesc="A sleek, dependency free terminal AI companion client."
arch=('any')
url="https://github.com/GORE-MODS/prismcli"
license=('MIT')
depends=('python')
source=("prismcli.py")
sha256sums=('8270257709d30618c8365af1eff4bffb53ff8e03ff92006b92079d0354530d9d')

package() {
    install -Dm755 "${srcdir}/prismcli.py" "${pkgdir}/usr/bin/prismcli"
}
