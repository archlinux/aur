# Maintainer: Alexander Rundberg <alexanderrundberg [at] fastmail [dot] jp>
pkgname=pretty-git-prompt
pkgver=0.2.0
pkgrel=1
pkgdesc="Pretty git status for your shell prompt"
arch=('any')
url="https://github.com/TomasTomecek/pretty-git-prompt"
license=('MIT')
depends=('git')
makedepends=('rust')
source=("https://github.com/TomasTomecek/pretty-git-prompt/archive/$pkgver.tar.gz")
md5sums=('de78492d10f69c9946ecec184ea00398')


package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make exec-stable-build
  install -Dm755 target/release/pretty-git-prompt "$pkgdir"/usr/bin/pretty-git-prompt
}
