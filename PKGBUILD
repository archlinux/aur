# Maintainer: Paul Spruce <paul.spruce@gmail.com>

_pkgname=waybackurls
pkgname=waybackurls-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Fetch all the URLs that the Wayback Machine knows about for a domain"
arch=(x86_64)
url="https://github.com/tomnomnom/waybackurls"
license=(MIT)
provides=(waybackurls)
conflicts=(waybackurls)
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-0.1.0.tgz")
source=("$pkgname-$pkgver-README.mkd::https://raw.githubusercontent.com/tomnomnom/waybackurls/86aeb97852707e1a6fb3bcd33e61d5433a6476c5/README.mkd")
b2sums_x86_64=("c948fae30944b776a08ba14aeb1b677f926caaf5289b920b2ef2bf0705803425ce841038b0ad3e4a31eafd29a44c6d5be27ab826c400e8bed548b22cbc68dc7e")
b2sums=("4a54672ef868def388278b06dc5c74ed794a454f97994a414cf485ca4d1762f9d2d433300cf68c79952a41714e9e8c37bb701475a29de13340cae32375005244")

package() {
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $pkgname-$pkgver-README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
}
