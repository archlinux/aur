# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='makesure'
pkgver=0.9.20
pkgrel=4
pkgdesc="Simple AWK-based task/command runner with declarative goals and dependencies"
arch=('any')
url='https://github.com/xonixx/makesure'
license=('MIT')
depends=('awk' 'sh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 makesure        "$pkgdir/usr/bin/makesure"
  install -Dm0644 completion.bash "$pkgdir/usr/share/bash-completion/completions/makesure"
  install -Dm0644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md       "$pkgdir/usr/share/docs/$pkgname/README.md"
}

sha256sums=(
  '5dcb79e08c014134b6032f075685428c7d3e2b1e41d1f27fddcb5e85bd9badca'
)
sha512sums=(
  'b5058ba56d48c8538f37e80f882ba6e295a695aafca852e5a1a3438e772a4a870404befba7e348799eba302b8c04be6d44f2e348d9c1523a1ecdd6fe81a50092'
)
b2sums=(
  '88ec34b02d887d5eb8661f57121e8ffa6f39c505f889059a0db0d3ec48f04a117ebdb3cfb9901a6a164ebfe08fa1cee27b7501ab09de30cfcc122bbeb4b73fc5'
)

# eof
