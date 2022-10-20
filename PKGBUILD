pkgname=nginx-user-service
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd user service for nginx."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}"
license=('MIT')
depends=('nginx')
options=('!strip')
source=('nginx.service')
sha256sums=('21aee6b30a2fd6ba62974d7730028f2387d4f07fef99620c442587b94b3353d7')

package() {
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" "${srcdir}/${source[0]}"
}
