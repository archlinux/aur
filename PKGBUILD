pkgname=spxc-webtools
pkgver=1.5
pkgrel=2
pkgdesc="Web management tools for spxc: Python servers, HTML cleaning, and site bundling"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-webtools"
license=('MIT')
depends=('bash' 'python' 'findutils' 'coreutils')
source=("spxc-web")
sha256sums=('0616194726b177ca036987c93e48810da594d6938927429be595304ce6338e55')

package() {
    install -Dm755 "${srcdir}/spxc-web" "${pkgdir}/usr/bin/spxc-web"
}
