pkgname=spxc-webtools
pkgver=1.6.1
pkgrel=2
pkgdesc="Web management tools for spxc: Python servers, HTML cleaning, and site bundling"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-webtools"
license=('MIT')
depends=('bash' 'python' 'findutils' 'coreutils')
source=("spxc-web")
sha256sums=('68c2664611852faca067d2544a0119b8b138bbad522afa7305a4a77772db21fe')

package() {
    install -Dm755 "${srcdir}/spxc-web" "${pkgdir}/usr/bin/spxc-web"
}
