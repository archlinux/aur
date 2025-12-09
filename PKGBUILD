# Maintainer: notgeocube@outlook.com
pkgname=chainz
pkgver=0.1.0   # you can set this to anything; main branch isn’t versioned
pkgrel=1
pkgdesc="Chainz executable from GitHub"
arch=('x86_64')
url="https://github.com/gdplayerokay/Chainz-package"
license=('MIT')
depends=()     # add dependencies if needed

# Pull directly from main branch as a zip
source=("https://github.com/gdplayerokay/Chainz-package/archive/refs/heads/main.zip")
sha256sums=('SKIP')  # optional; you can compute a real hash if desired

package() {
    # The zip extracts to Chainz-package-main/
    install -Dm755 "$srcdir/Chainz-package-main/chainz" "$pkgdir/usr/bin/chainz"
}

