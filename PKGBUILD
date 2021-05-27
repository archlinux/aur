# Maintainer: Daryl Ronningen <relms@relms.dev>

pkgname=prideflags-wallpapers
pkgver=1.0.0
pkgrel=1
pkgdesc='Pride Flags Wallpapers'
arch=(any)
url='https://code.relms.dev/Relms/pride-flags-wallpapers'
makedepends=('tar')
optdepends=('feh: set desktop wallpapers')
license=('custom:none')
source=('flags.tar.xz')
sha256sums=('b9e7734849b47a8e252b5919f49d929b0485cba3fc3077a2fb32a9bd30d2cd93')

package() {
  install -Dm644 -t "$pkgdir/usr/share/backgrounds/prideflags/" flags/*
}
