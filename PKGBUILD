# Maintainer: Daryl Ronningen <relms@relms.dev>

_attachmentId='2fd51467-e88e-42c6-9165-3e07a9fc21eb'

pkgname=prideflags-wallpapers
pkgver=1.0.0
pkgrel=3
pkgdesc='Pride Flags Wallpapers'
arch=(any)
url='https://code.relms.dev/Relms/pride-flags-wallpapers'
optdepends=('feh: set desktop wallpapers')
license=('custom:CC0')
source=("flags.tar.xz::https://code.relms.dev/attachments/${_attachmentId}")
sha256sums=('a752d57d502eced21a3277d7a8bd4cb192c7d512b6f7ec9ece8a0fe1db3a3ca1')

package() {
  install -Dm644 flags/* -t "$pkgdir/usr/share/backgrounds/prideflags/"
  install -Dm644 flags/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
