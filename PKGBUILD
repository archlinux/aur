# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=erg-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="The Erg programming language"
url="https://erg-lang.github.io/"
license=("MIT OR Apache-2.0")
arch=("x86_64")
provides=("erg")
conflicts=("erg")
source=("https://yuioto-onedrive.vercel.app/api/raw/?path=/tmp/erg/erg-$pkgver-$arch.tar.gz")
sha256sums=("4e7b7bd7f2663bd0a936132eb26e94c86ccd4a477fe52cbb29720bf61be7fb8d")

package() {
    install -Dm755 erg -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
