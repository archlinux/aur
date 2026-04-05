pkgname=spxc-webtools
pkgver=1.6.5
pkgrel=2
pkgdesc="Web management tools for spxc: Python servers, HTML cleaning, and site bundling"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-webtools"
license=('MIT')
depends=('bash' 'python' 'findutils' 'coreutils')
source=("spxc-web")
sha256sums=('e987be6f37464a025d6b195488d7208f54fbe2d3ea0f9dce181d9d1494291afd')

package() {
    install -Dm755 "${srcdir}/spxc-web" "${pkgdir}/usr/bin/spxc-web"
}
