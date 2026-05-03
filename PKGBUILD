# Maintainer: ShinKouyo <i@0x0f.dev>

pkgname=mkinitcpio-archiso-ventoy
pkgver=0.1.0
pkgrel=1
pkgdesc='mkinitcpio hook to detect Ventoy boot metadata for archiso'
arch=('any')
url='https://codeberg.org/shkouyo/sk-archiso/src/commit/f044b721932ebc774c02ccf2e9ee124a32e00055/airootfs/usr/lib/initcpio'
license=('GPL-3.0-or-later')
depends=('mkinitcpio')
source=(
  'archiso_ventoy_hook'
  'archiso_ventoy_install'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

package() {
  install -Dm644 "${srcdir}/archiso_ventoy_hook" "${pkgdir}/usr/lib/initcpio/hooks/archiso_ventoy"
  install -Dm644 "${srcdir}/archiso_ventoy_install" "${pkgdir}/usr/lib/initcpio/install/archiso_ventoy"
}
