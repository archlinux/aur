# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme
pkgver=5.4.0  # renovate: datasource=github-tags depName=SylEleuth/gruvbox-plus-icon-pack
pkgrel=1
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
sha256sums=('46c5974d4b74eb641f2d77af24db318dbf6150662c696eddf5373e8b8e090686')

package() {
    cd "gruvbox-plus-icon-pack-$pkgver"
    install -d "$pkgdir/usr/share/icons"
    cp -r ./ "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
}
