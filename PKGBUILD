pkgname=spxc-webtools
pkgver=1.7.2
pkgrel=2
pkgdesc="Web management tools for spxc: Python servers, HTML cleaning, and site bundling"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-webtools"
license=('MIT')
depends=('bash' 'python' 'findutils' 'coreutils')
source=("spxc-web")
sha256sums=('36062a54bc62ac2ec8f6ca09c6c5f9bdbffe2b8a29711443a919988c40656c9a')

package() {
    install -Dm755 "${srcdir}/spxc-web" "${pkgdir}/usr/bin/spxc-web"
}
