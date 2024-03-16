# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=0.124.1
pkgrel=1
pkgdesc='CSVs sliced, diced & analyzed. Quicksilver (qsv) is a fork of the popular xsv utility'
arch=(x86_64)
url='https://github.com/jqnatividad/qsv'
license=('MIT' 'UNLICENSE')
provides=('qsv')
conflicts=('qsv')
source=("$url/raw/$pkgver/LICENSE-MIT" "$url/raw/$pkgver/UNLICENSE")
source_x86_64=("$url/releases/download/$pkgver/qsv-$pkgver-x86_64-unknown-linux-gnu.zip")
sha256sums=('08579b91a9557dcf2ec5085c2f4e01766c489e18f65128f854427796ad31acb4'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')
sha256sums_x86_64=('e48cacb73aa1e8b2f55569a8362d2452c74f589173ee95aeef7e8e5e0271ee8c')

package() {
    install -Dm0755 "$_pkg" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
