# Maintainer: Barra Ihsan <barra at duck dot com>
pkgname="jerry-cli"
_pkgname="jerry"
pkgver=1.9.9
pkgrel=2
pkgdesc="watch anime with automatic anilist syncing and other cool stuff"
arch=('any')
url="https://github.com/justchokingaround/jerry"
license=('unknown')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv')
makedepends=('git')
optdepends=('rofi: external launcher' 'ueberzugpp: image preview with fzf' 'chafa: display image' 'jq: for displaying anime/manga info')
conflicts=("${pkgname}-git")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3902F5C5201C0AB653CF0F94080E82436A63367A7BA7F6AECA1B480CB1B1C8B0')

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "./jerry.sh" "${pkgdir}/usr/bin/jerry"
}
