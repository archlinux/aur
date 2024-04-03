# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
_pkgname=ttf-patrick-hand
pkgname="$_pkgname"-full
pkgver=2.001
pkgrel=2
pkgdesc='font based on Patrick Wagesreiter’s handwriting'
arch=(any)
url="https://fonts.google.com/specimen/Patrick+Hand"
_commit=4d3753bff382cefeff2925722f8dcff2836b6f62
license=(OFL-1.1-no-RFN)
source=("https://github.com/google/fonts/raw/$_commit/ofl/patrickhand/OFL.txt"
        "https://github.com/google/fonts/raw/$_commit/ofl/patrickhand/PatrickHand-Regular.ttf"
        "https://github.com/google/fonts/raw/$_commit/ofl/patrickhandsc/PatrickHandSC-Regular.ttf")
sha256sums=('377f4f9c19e935228552478eb68cc2ed82910988a60ba60e2ac73b09f32d02d1'
            '0f173b3e6cb6d1af25babf7f0057c5ac4ee11f9992b0469bb817e967ef4ad0fc'
            '83eff88cfa3c4e501e25f334c0a1a88eb4d4af1ea9d4c32900edf2fb178244dc')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
