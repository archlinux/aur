pkgname=zrythm-bin
pkgver=1.0.0
pkgrel=6
pkgdesc="Zrythm DAW (prebuilt binary)"
arch=("x86_64")
url="https://github.com/IRRatium/zrythm-aur-bin"
license=("AGPL3")
provides=("zrythm")
conflicts=("zrythm")
depends=(gtk4 libadwaita pipewire-jack lilv lv2 libcyaml fftw)
source=("zrythm.pkg.tar.zst::https://github.com/IRRatium/zrythm-aur-bin/releases/download/v1.0.0-6/zrythm-1.0.0-6-x86_64.pkg.tar.zst")
sha256sums=("7fca9b6e8ca6acb92e64b377817b122e8894f924d6b7195c3f6ccaafa542616d")

package() {
  bsdtar -xf "zrythm.pkg.tar.zst" -C "$pkgdir"
  rm -rf "$pkgdir"/{.PKGINFO,.BUILDINFO,.MTREE}
}
