pkgname=spxc-webtools
pkgver=1.6
pkgrel=2
pkgdesc="Web management tools for spxc: Python servers, HTML cleaning, and site bundling"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-webtools"
license=('MIT')
depends=('bash' 'python' 'findutils' 'coreutils')
source=("spxc-web")
sha256sums=('2a57c180ec852dc466491d6794e4460de9ad3d2c46702c2c6609f11cf8db099d')

package() {
    install -Dm755 "${srcdir}/spxc-web" "${pkgdir}/usr/bin/spxc-web"
}
