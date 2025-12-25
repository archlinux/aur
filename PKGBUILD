# Maintainer: ftiasch <ftiasch0@gmail.com>
pkgname=backlog.md
pkgver=1.28.0
pkgrel=1
pkgdesc="Markdown-native Task Manager & Kanban visualizer for any Git repository"
arch=('x86_64')
url="https://github.com/MrLesk/Backlog.md"
license=('MIT')
depends=('glibc')
provides=('backlog')
conflicts=('backlog')

source=("$pkgname-$pkgver::https://github.com/MrLesk/Backlog.md/releases/download/v${pkgver}/backlog-bun-linux-x64-baseline")
sha256sums=('0d3511b8aad3a9fda337e19b8d03bdef37123d70374725b7dd3d4ea4d425f2f2')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/backlog"
}
