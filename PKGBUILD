# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=prismcli
pkgver=1.1
pkgrel=1
pkgdesc="A sleek, dependency free terminal AI companion client."
arch=('any')
url="https://github.com/GORE-MODS/prismcli"
license=('MIT')
depends=('python')
source=("prismcli.py")
sha256sums=('26a35ea155f5dcbc58837b8cad3eb8016a1b787cb9bb93f0f843c791f155b251')

package() {
    install -Dm755 "${srcdir}/prismcli.py" "${pkgdir}/usr/bin/prismcli"
}
