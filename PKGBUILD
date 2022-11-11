# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal-bin
_pkgname=conceal
pkgver=0.1.4
pkgrel=1
pkgdesc="A trash collector."
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
conflicts=('conceal')
depends=('skim')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-$arch.tar.gz")
sha256sums=('7cc107cccfd303d67de3854dcc597f3617f46c1fd0560d2afe68a852c0e57dbb')

package() {
  install -Dm 755 "cnc" -t "$pkgdir/usr/bin"

  install -Dm 644 "cnc.bash" -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm 644 "cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "cnc.nu" -t "$pkgdir/usr/share/nushell/completions"
}
