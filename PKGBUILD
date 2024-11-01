# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme
pkgver=5.5.0 # renovate: datasource=github-tags depName=SylEleuth/gruvbox-plus-icon-pack
pkgrel=2
pkgdesc="Icon theme based on Gruvbox color scheme"
arch=(any)
url=https://github.com/SylEleuth/gruvbox-plus-icon-pack
license=(GPL3)
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=(gruvbox-plus-icon-theme)
conflicts=(gruvbox-plus-icon-theme-git)
options=(!strip !emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c03a10607e090e0a1d10a415c8be200b11b9a1bdc46d6e189b0577de0e94339')

package() {
  cd "gruvbox-plus-icon-pack-$pkgver"
  install -d "$pkgdir/usr/share/icons"
  cp -r ./Gruvbox-Plus-Dark "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
}
