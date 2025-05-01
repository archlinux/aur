pkgname=nginx-user-service
pkgver=1.0.3
pkgrel=1
pkgdesc='Systemd user service for nginx'
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}"
license=('MIT')
depends=('nginx')
options=('!strip')

source=('nginx.service')
sha256sums=('8feeb9112c8393f24d0c138e069a1c4a3f7dc70e26029d72813e85b230bf653b')

package() {
    cd "${srcdir}"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" 'nginx.service'
}
