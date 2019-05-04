# Maintainer: Svitozar Cherepii <razotivs@gmail.com>
pkgname=rvgl-soundtrack
pkgver=18.1126
pkgrel=1
pkgdesc="RVGL community-made sountrack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
source=("https://distribute.re-volt.io/packs/soundtrack.zip"
        "https://distribute.re-volt.io/releases/soundtrack.txt")
sha256sums=('cb25d46b9cc2d6658a07bcd874566960d54e6617c90b3e594741dee5632c5c20'
            'SKIP')

pkgver() {
    cat soundtrack.txt
}

package() {
    find redbook music -type f -exec \
        install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
