# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>
# Contributor: Daniel Menelkir <dmenelkir [at] gmail [dot] com>

pkgname="plymouth-theme-artix-logo-new"
pkgver=0.3
pkgrel=1
pkgdesc="Replace the logo from package plymouth-theme-artix-logo"
arch=('any')
url="https://github.com/MeganerdNL/plymouth-theme-artix-logo-new"
license=('GPL')
depends=('plymouth')
source=("https://github.com/MeganerdNL/plymouth-theme-artix-logo-new/archive/${pkgver}.zip")
sha256sums=('4dbd08e2350a7fef1c5de07e4ec63638f2e3328bd2f7ee7aa6a1cbf5caf7987d')
install="plymouth-theme-artix-logo-new.install"

package() {
    cd "${srcdir}/plymouth-theme-artix-logo-new-${pkgver}"
    mkdir -p $pkgdir/usr/share/plymouth/themes/artix-logo-new
    install -Dm644 *.png $pkgdir/usr/share/plymouth/themes/artix-logo-new
    install -Dm644 artix-logo-new.script $pkgdir/usr/share/plymouth/themes/artix-logo-new
    install -Dm644 artix-logo-new.plymouth $pkgdir/usr/share/plymouth/themes/artix-logo-new
}
