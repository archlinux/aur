# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=neverwinter.nim
pkgver=1.2.10
pkgrel=1
pkgdesc="A nim-lang library and utility collection to read and write data files used by Neverwinter Nights 1"
arch=('any')
url="https://github.com/niv/neverwinter.nim"
license=('MIT')
makedepends=('nim>=1.2.0' 'nimble')
source=("https://github.com/niv/neverwinter.nim/archive/1.2.10-1.2.0.tar.gz")
md5sums=('bea3e9dd811d82bacaf9efb08c833ebd')

package() {
	cd neverwinter.nim-1.2.10-1.2.0
    nimble build -d:release
    install -Dm 755 "bin/nwn_twoda" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_tlk" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_ssf" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_resman_stats" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_resman_pkg" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_resman_grep" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_resman_extract" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_resman_diff" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_resman_cat" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_net" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_key_unpack" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_key_transparent" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_key_shadows" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_key_pack" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_gff" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_erf_tlkify" -t "$pkgdir/usr/bin"
    install -Dm 755 "bin/nwn_erf" -t "$pkgdir/usr/bin"
    install -Dm 755 "LICENCE" -t "$pkgdir/usr/share/neverwinter.nim"
}
