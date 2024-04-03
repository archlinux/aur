# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-buenard
pkgver=1.002
pkgrel=4
_commit=90d7886db9000c893b9559828bf028aaed5f9c10
pkgdesc='Classic serif font for art books by Gustavo Ibarra'
arch=(any)
url="https://fonts.google.com/specimen/Buenard"
license=(OFL-1.1-RFN)
source=("https://github.com/google/fonts/raw/$_commit/ofl/buenard/OFL.txt"
        "https://github.com/google/fonts/raw/$_commit/ofl/buenard/Buenard-Regular.ttf"
        "https://github.com/google/fonts/raw/$_commit/ofl/buenard/Buenard-Bold.ttf")
sha256sums=('3bbcf1617d93d3a949a10da78ae91c58be536fb04567ab4b5b9fd207126f1db5'
            '50bf037d68b08cd9b32b87e5f5b51ec490f196ff9b25b9cfb6733d24edd68577'
            'c71bf08fe62d56f74bfd6b35c4558f57684735ec6b9cffc6f6b40ccf9b0691f0')

package() {
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -D -m644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
