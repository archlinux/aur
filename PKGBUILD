# Maintainer: SharpIce <VupRbl@163.com>

# shellcheck shell=bash disable=SC2034,SC2154

_commit=326a9ea5e5d285587258be405d47a1191b9169a1

pkgname=ttf-iridesce-scratch
pkgver=20260702
pkgrel=1
pkgdesc="A sci-fi mechanical font from the fictional universe of 'Iridesce Independent'"
arch=('any')
url="https://github.com/IridesceIFC/Iridesce-Scratch"
license=('OFL-1.1')
depends=()
makedepends=('git')
source=("iridesce-scratch::git+https://github.com/IridesceIFC/Iridesce-Scratch.git#commit=$_commit")
sha256sums=('SKIP')

package() {
  cd "$srcdir/iridesce-scratch" || return

  install -Dm644 'Iridesce scratch Regular.ttf' "$pkgdir/usr/share/fonts/TTF/Iridesce scratch Regular.ttf"
  install -Dm644 'Iridesce scratch Italic.ttf'  "$pkgdir/usr/share/fonts/TTF/Iridesce scratch Italic.ttf"

  install -Dm644 'readme OFL.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
