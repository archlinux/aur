# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=prismcli
pkgver=1.4
pkgrel=1
pkgdesc="A sleek, dependency free terminal AI companion client."
arch=('any')
url="https://github.com/GORE-MODS/prismcli"
license=('MIT')
depends=('ollama' 'python')
source=("prismcli.py")
sha256sums=('70cb5d0cdc557f476258267e3612327cb232fd0088cd9261681554783d794284')

package() {
    install -Dm755 "${srcdir}/prismcli.py" "${pkgdir}/usr/bin/prismcli"
}
