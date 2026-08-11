# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=git-credential-rbw
pkgver=1.15.0
pkgrel=1
pkgdesc="Contrib script for using rbw as a git credential helper"
arch=('any')
url="https://github.com/doy/rbw/blob/main/bin/git-credential-rbw"
license=('MIT')
depends=('bash')
source=("https://github.com/doy/rbw/raw/refs/tags/${pkgver}/bin/${pkgname}"
		"https://github.com/doy/rbw/raw/refs/tags/${pkgver}/LICENSE")
sha256sums=('0207c0da6385d16ec307848bc8e01fc09c497e37700340596e5177a8ca558920'
            '09797bd062e199701669fa9509b0a3aae369543f95e70f3586f20ccd1232bd71')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname}"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/" "LICENSE"
}
