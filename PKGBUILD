# Maintainer: mainstreamos <https://github.com/MainstreamOS>
groups=(mainstream)
pkgname=mainstream-bibata-modern-classic-bin
pkgver=2.0.6
pkgrel=3
pkgdesc="Material Based Cursor Theme, packaged for Mainstream OS dotfiles"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL-3.0-or-later')
provides=('illogical-impulse-bibata-modern-classic-bin')
replaces=('illogical-impulse-bibata-modern-classic-bin')
conflicts=("bibata-cursor-theme" "bibata-cursor-theme-bin")
options=('!strip')
_variant=Bibata-Modern-Classic
source=("${pkgname%-bin}-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_variant.tar.xz")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=mode $_variant "$pkgdir/usr/share/icons"
}
