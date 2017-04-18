# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=arukas-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="The Arukas CLI"
arch=('x86_64')
url="https://github.com/arukasio/cli"
license=('MIT')
source=("https://github.com/arukasio/cli/releases/download/v$pkgver/arukas_v0.2.0_linux_amd64.zip"
        "https://raw.githubusercontent.com/arukasio/cli/v$pkgver/README.md"
        "https://raw.githubusercontent.com/arukasio/cli/v$pkgver/LICENSE.txt"
        "https://raw.githubusercontent.com/arukasio/cli/v$pkgver/.env.sample")
md5sums=('7033ddb01034e525eef768ab1ffe20cd'
         '83ad09575e9f3c8a48014c4c4a220756'
         'a9c1a8609cc5af6e2009a83ac2411de2'
         '9ec1ff716be381c2b4f07eb4c0e3db92')

package() {
  install -D -m755 arukas "$pkgdir/usr/bin/arukas"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md LICENSE.txt .env.sample
}
