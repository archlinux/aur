# Maintainer: Daryl Ronningen <relms@relms.dev>

_attachmentId='d21371d7-170c-458c-b280-ffe9da43658e'

pkgname=prideflags-wallpapers
pkgver=1.1.0
pkgrel=2
pkgdesc='Pride Flags Wallpapers'
arch=(any)
url='https://code.relms.dev/Relms/prideflags-wallpapers'
optdepends=('feh: set desktop wallpapers')
license=('custom:CC0')
source=("flags-${pkgver}-${pkgrel}.tar.xz::https://code.relms.dev/attachments/${_attachmentId}")
sha256sums=('4f739c1491e544acaeebb16406ed8929b02f5ef20b68909df60affbc5fb7501c')

package() {
  install -Dm644 flags/hd/* -t "$pkgdir/usr/share/backgrounds/prideflags/hd"
  install -Dm644 flags/4k/* -t "$pkgdir/usr/share/backgrounds/prideflags/4k"
  install -Dm644 flags/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
