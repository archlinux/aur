pkgname=sudo-apt-install-opsec
pkgver=1.0.0
pkgrel=1
pkgdesc="Prove how much opsec you are"
arch=('any')
license=('MIT')
url="https://github.com/thebiggestlarp/opsec"
source=("https://raw.githubusercontent.com/thebiggestlarp/opsec/main/opsec")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/opsec" "${pkgdir}/usr/bin/sudo-apt-install-opsec"
}
