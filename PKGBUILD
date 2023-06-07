# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

_pkgbase=intel-one-mono
pkgbase=intel-one-mono-fonts
pkgname=(otf-$_pkgbase ttf-$_pkgbase)
pkgver=1.2.1
pkgrel=1
pkgdesc="Expressive monospaced font family that’s built with clarity, legibility, and the needs of developers in mind"
url="https://github.com/intel/intel-one-mono"
arch=(any)
license=(custom:OFL)
source=(https://github.com/intel/$_pkgbase/releases/download/V$pkgver/otf.zip
        https://github.com/intel/$_pkgbase/releases/download/V$pkgver/ttf.zip)
sha256sums=('44127021492601921168811653115995131f15350574b6c708c4646a0534814d'
            '0d5fcf4fe3fe186abf7a34b9731e4436e0b2fa2884df600c3a2af0b9308fdef6')

package_otf-intel-one-mono() {
  cd otf
  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 *.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 license
}

package_ttf-intel-one-mono() {
  cd ttf
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 license
}
