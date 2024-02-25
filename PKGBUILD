# Maintainer: ZappaBoy <federico.zappone@justanother.cloud>
pkgname=discord-wakatime
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="BetterDiscord plugin for automatic time tracking and stats about your Discord usage"
arch=('any')
url="https://github.com/wakatime/discord-wakatime"
license=('BSD 3-Clause ')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f0f2b942832d0e831e534640b6db83fd0b55d54bf905aabcc1eda968126428a5')
noextract=()

check() {
  cd "$srcdir/$pkgname-$pkgver"
  [ -f "$srcdir/$pkgname-$pkgver/discord-wakatime.plugin.js" ]
}

package() {
  cd "$srcdir"
  tar xvf "$pkgver.tar.gz"
  install -Dm644 "$srcdir/$pkgname-$pkgver/discord-wakatime.plugin.js" "$pkgdir/home/$USER/.config/BetterDiscord/plugins/discord-wakatime.plugin.js"
}

# vim:set ts=2 sw=2 et:
