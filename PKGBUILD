# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Lara Maia <lara@craft.net.br>
#
pkgname="geany-theme-github"
pkgver="1"
pkgrel="4"
pkgdesc="A github like theme for Geany"
arch=(any)
url="http://lara.click"
license=('GPL')
depends=('geany')
source=("http://downloads.lara.click/Geany/github.conf")
sha256sums=('a634613338f438a216684dd1e0ce4c92dae3d778b1a4f3fc56ef71339d9c9310')

package() {
    install -Dm644 "$srcdir"/github.conf "$pkgdir"/usr/share/geany/colorschemes/github.conf
}

# vim:set ts=4 sw=2 ft=sh et:
