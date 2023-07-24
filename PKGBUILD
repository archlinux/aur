# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=0.109.0
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
sha256sums_x86_64=('f4337103741a03b2fcb3b13747a55bc84f87d896c39746be817bf07b309f525d')

package() {
    install -Dm0755 "$_pkg" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "UNLICENSE" "$pkgdir/usr/share/licenses/${pkgname}/UNLICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
