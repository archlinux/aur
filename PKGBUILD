# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=prismcli
pkgver=1.0
pkgrel=1
pkgdesc="A sleek, dependency free terminal AI companion client."
arch=('any')
url="https://github.com/GORE-MODS/prismcli"
license=('MIT')
depends=('python')
source=("prismcli.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/prismcli.py" "${pkgdir}/usr/bin/prismcli"
}
