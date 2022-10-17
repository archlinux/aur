# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=waybackurls
pkgname=waybackurls-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fetch all the URLs that the Wayback Machine knows about for a domain"
arch=(x86_64)
url="https://github.com/tomnomnom/waybackurls"
license=(MIT)
provides=(waybackurls)
conflicts=(waybackurls)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-0.1.0.tgz")
b2sums=(SKIP)

package() {
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
}
