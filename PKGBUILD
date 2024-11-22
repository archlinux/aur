# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_commit=bc29a39aec9768acec001ebfd9aec83fc769aaae
pkgbase=chicago-kare
pkgname=('otf-chicago-kare'
         'ttf-chicago-kare')
pkgver=1.0.1
pkgrel=1
pkgdesc='A Faithful Reproduction of the Bitmap Version of the Chicago Typeface'
arch=('any')
url='https://chicagokare.xyz/'
license=('MIT')
makedepends=('git')
source=("${pkgbase}::git+https://github.com/KingDuane/Chicago-Kare.git#commit=${_commit}")
b2sums=('e543ab53aa4a519b0ef29f479eaa5391592922e3aeedb3dfeff52e14cc579eabb5e19f1124c0bbcb4f65f7e136da4e0c318fa82beb99cf11ee79328a0edc471a')

package_otf-chicago-kare() {
  install -dm755 ${pkgdir}/usr/share/fonts/OTF/
  install -m644 ${pkgbase}/*.otf ${pkgdir}/usr/share/fonts/OTF/
}

package_ttf-chicago-kare() {
  install -dm755 ${pkgdir}/usr/share/fonts/TTF/
  install -m644 ${pkgbase}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
