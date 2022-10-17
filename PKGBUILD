# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=meg
pkgname=meg-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Fetch many paths for many hosts - without killing the hosts"
arch=(x86_64)
url="https://github.com/tomnomnom/meg"
license=(MIT)
provides=(meg)
conflicts=(meg)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-0.3.0.tgz")
b2sums=(SKIP)

package() {
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
}
