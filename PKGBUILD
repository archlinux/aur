# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
pkgname=flowerss-bot
pkgver=0.8.3
pkgrel=1
pkgdesc="A telegram bot for rss reader. 一个支持应用内阅读的 Telegram RSS Bot。"
arch=('x86_64')
url="https://github.com/indes/flowerss-bot"
license=('GPL')
depends=()
makedepends=(git go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/indes/flowerss-bot/archive/refs/tags/v${pkgver}.zip")
sha256sums=('4993cd20fc71a5515e5900fc440dbe7664e6a0bbbf421398f023b7ab0e26ab8c')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "flowerss-bot" "$pkgdir/usr/bin/flowerss-bot"
}
