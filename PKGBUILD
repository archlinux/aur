pkgname=cynix-lsb-release
pkgver=1.2
pkgrel=1
pkgdesc="Custom Cynix Linux distribution information"
arch=('any')
license=('MIT')
depends=('lsb-release')

package() {
    # Copy script to package directory
    install -Dm755 cynix-lsb-release "${pkgdir}/usr/bin/install_custom_lsb_release"

    # Create custom lsb-release file
    echo "DISTRIB_ID=Cynix" > "${pkgdir}/etc/lsb-release"
    echo "DISTRIB_RELEASE=1.0" >> "${pkgdir}/etc/lsb-release"
    echo "DISTRIB_DESCRIPTION=\"Cynix Linux\"" >> "${pkgdir}/etc/lsb-release"
}

# Add metadata
source=("cynix-lsb-release")
sha256sums=('SKIP')

