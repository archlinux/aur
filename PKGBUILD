# Maintainer: Egevtech

pkgname=mkcd-fish
pkgver=0.1.0
pkgrel=2

pkgdesk="Fish function that creates directory and change into it"
url="https://github.com/egevtech/mkcd"
license=("BCD3")
arch=('any')

provides=("mkcd-fish")
conflicts=("mkcd-fish")
source=("git+https://github.com/egevtech/mkcd.git")
sha256sums=("SKIP")

depends=("fish")

package() {
  cd "$srcdir/mkcd"
  install -Dm755 mkcd.fish -t "$pkgdir/etc/fish/functions/"
}
