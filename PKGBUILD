# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal-bin
_pkgname=conceal
pkgver=0.1.5
pkgrel=1
pkgdesc="A trash collector."
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
conflicts=('conceal')
depends=('skim')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-$arch.tar.gz")
sha256sums=('7c6cd449da4ef6bc5aae30b2a6960b4ee486281fbc20498b70970fbbe69731d3')

package() {
  install -Dm 755 "cnc" -t "$pkgdir/usr/bin"

  install -Dm 644 "cnc.bash" -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm 644 "cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "cnc.nu" -t "$pkgdir/usr/share/nushell/completions"
}
