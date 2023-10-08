# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='makesure'
pkgver=0.9.21
pkgrel=2
pkgdesc="Simple AWK-based task/command runner with declarative goals and dependencies"
arch=('any')
url='https://github.com/xonixx/makesure'
license=('MIT')
depends=('awk' 'sh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 makesure        "$pkgdir/usr/bin/makesure"
  install -Dm0644 completion.bash "$pkgdir/usr/share/bash-completion/completions/makesure"
  install -Dm0644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md       "$pkgdir/usr/share/docs/$pkgname/README.md"
}

sha256sums=(
  'dbbca22612d44fc3c2d972f399160202068099fee2d7c6cb5b2bbc5833448bd5'
)
b2sums=(
  'cae03a297553c4e681a111f3ab854ac1d1b35211ad744806f6577d0d33ed1b300461a312d22be3cbe790a1e66bd9828058d94b498e8b3491a2e3513072cc2a4d'
)

# eof
