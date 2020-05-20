# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-soundtrack-orig
pkgver=18.0327
pkgrel=2
pkgdesc="RVGL original Dreamcast soundtrack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
provides=('rvgl-soundtrack')
conflicts=('rvgl-soundtrack')
source=("soundtrack.zip::https://distribute.re-volt.io/packs/soundtrack.zip")
sha256sums=('44b3d9ab4793d69531c5943bac4027fd0cbd60e49ed75db766a56a5a80d32223')

package() {
    find redbook -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
