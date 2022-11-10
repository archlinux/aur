# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal-bin
_pkgname=conceal
pkgver=0.1.3
pkgrel=1
pkgdesc="A trash collector."
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
conflicts=('conceal')
depends=('skim')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-$arch.tar.gz")
sha256sums=('e3cec0136f158faa1e0365baa9d588e8c743937be9c854f0ad3d2cd063b5217b')

package() {
  install -Dm 755 "cnc" -t "$pkgdir/usr/bin"

  install -Dm 644 "cnc.bash" -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm 644 "cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "cnc.nu" -t "$pkgdir/usr/share/nushell/completions"
}
