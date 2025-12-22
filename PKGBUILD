# Maintainer: Oliver Schantz <frequency403@gmail.com>
pkgname=openssh-gui-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A graphical user interface for OpenSSH (Pre-compiled)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI" # Replace with your actual repo URL
license=('MIT')
depends=('icu' 'openssl' 'zlib')
provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-git')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/OpenSSH-GUI-linux-x64")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/openssh-gui"
}
