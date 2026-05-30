# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=prismcli
pkgver=1.3
pkgrel=1
pkgdesc="A sleek, dependency free terminal AI companion client."
arch=('any')
url="https://github.com/GORE-MODS/prismcli"
license=('MIT')
depends=('python')
source=("prismcli.py")
sha256sums=('59508dd0db535fc61ff5d75c8bb6002395703536bc9480a133e14f5d19fdc93e')

package() {
    install -Dm755 "${srcdir}/prismcli.py" "${pkgdir}/usr/bin/prismcli"
}
