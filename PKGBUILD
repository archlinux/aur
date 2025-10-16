# Maintainer: execrooted <execrooted@gmail.com>

pkgname=droplet
pkgver=0.1.3
pkgrel=1
pkgdesc="droplet is no longer a package. Please run paru -S root_rain to install the new updated package. You can remove this one with paru -R droplet"
arch=('any')
url="https://github.com/execrooted/root_rain"
license=('MIT')
depends=()
makedepends=()
source=()
sha256sums=()

package() {
    # This package is deprecated - it just prints a message
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/droplet" << 'SCRIPT_EOF'
#!/bin/bash
echo "droplet is no longer a package. Please run paru -S root_rain to install the new updated package. You can remove this one with paru -R droplet"
SCRIPT_EOF
    chmod +x "$pkgdir/usr/bin/droplet"
}
