# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-soundtrack-orig
pkgver=18.0327
pkgrel=1
pkgdesc="RVGL original Dreamcast soundtrack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
conflicts=('rvgl-soundtrack')
source=("https://distribute.re-volt.io/packs/soundtrack_orig.zip"
        "https://distribute.re-volt.io/releases/soundtrack_orig.txt")
sha256sums=('75ab81ba477495841939ea14ee3200adb0f8cb91ef0e54b9964dc0da8b7f1475'
            'SKIP')

pkgver() {
    cat soundtrack_orig.txt
}

package() {
    find redbook -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
