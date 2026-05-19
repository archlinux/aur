# Maintainer: Zain Khan <zai1208@protonmail.com>
pkgname=pwss-browser-glow-git
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI-first browsing experience for the PWSS protocol."
arch=('any')
url="https://github.com/zai1208/pwss-browser-glow"
license=('GPL3')
depends=('glow' 'pwss-core-git' 'pwss-fetch-https-git')
source=("git+https://github.com/zai1208/pwss-browser-glow.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pwss-browser-glow"
  install -Dm755 pwss-browser-glow "$pkgdir/usr/bin/pwss-browser-glow"
}
