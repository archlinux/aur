# Maintainer: L14ms1 <L14ms1@protonmail.com>
pkgname=assbreak
pkgver=0.1.15
pkgrel=1
makedepends=('chromedriver' 'cargo' 'rust')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="a tool that helps brute-force a website and address mail."
url="https://github.com/L14ms111/assbreak"
license=('MPL-2.0')

build() {
    return 0
}

package() {
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --git=https://github.com/L14ms111/assbreak
}
