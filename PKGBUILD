# Maintainer: Reyansh Raj Mishra <reyanshrajmishra8@gmail.com>
pkgname=shield-cleaner
pkgver=1.0.3
pkgrel=2
pkgdesc="SHIELD Interactive System Cleaner - Advanced maintenance tool for Arch Linux"
arch=('any')
url="https://github.com/reyanshrajmishra/shield-cleaner"
license=('MIT')
depends=('bash' 'pacman' 'util-linux' 'coreutils')
optdepends=('yay: for AUR cache cleaning')
source=("shield-cleaner.sh"
        "LICENSE")
sha256sums=('4296012d2269ca1e9d3a4ed4175ee66b6a044322692a752b177b19c85b25e9b5'
            '19c602dd2a18e02590e4f99cb0917abd819fe2c360bea72fd237a59ae25d5596')

package() {
    # Install the main script
    install -Dm755 "${srcdir}/shield-cleaner.sh" "${pkgdir}/usr/bin/shield-cleaner"
    
    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
