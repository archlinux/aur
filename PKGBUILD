# Maintainer: Daryl Ronningen <relms@relms.dev>

_attachmentId='c9896da7-2281-41f5-bbc8-f5e92a1d82e0'

pkgname=prideflags-wallpapers
pkgver=1.1.0
pkgrel=1
pkgdesc='Pride Flags Wallpapers'
arch=(any)
url='https://code.relms.dev/Relms/pride-flags-wallpapers'
optdepends=('feh: set desktop wallpapers')
license=('custom:CC0')
source=("flags.tar.xz::https://code.relms.dev/attachments/${_attachmentId}")
sha256sums=('4f739c1491e544acaeebb16406ed8929b02f5ef20b68909df60affbc5fb7501c')

package() {
  install -Dm644 flags/hd/* -t "$pkgdir/usr/share/backgrounds/prideflags/hd"
  install -Dm644 flags/4k/* -t "$pkgdir/usr/share/backgrounds/prideflags/4k"
  install -Dm644 flags/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
