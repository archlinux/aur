# Maintainer: pbar <piercebartine@gmail.com>

pkgname=pbar-hello-world-bin
pkgdesc="Hello world!"
pkgver=1.4.10
pkgrel=1
arch=('x86_64')
url="https://github.com/pbar1/hello-world"
license=('Beerware')
source_x86_64=(hello-world::https://github.com/pbar1/hello-world/releases/download/v$pkgver/hello-world_v${pkgver}_linux_amd64)
sha256sums_x86_64=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  install -Dm 755 "$srcdir/hello-world" "$pkgdir/usr/bin/hello-world"
}
