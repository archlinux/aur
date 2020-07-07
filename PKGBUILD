# Maintainer: Paul Clark <paul500clark at gmail dot com>
pkgname=ttf-dp-sans-mono
pkgver=draft14
pkgrel=1
pkgdesc="A custom font optimized for proofreading, the spiritual successor to DPCustomMono2"
arch=(any)
url="https://www.pgdp.net/wiki/DP_Sans_Mono"
source=(DPSansMono-$pkgver.ttf::https://github.com/DistributedProofreaders/dproofreaders/raw/master/styles/fonts/DPSansMono.ttf
	LICENSE)
sha256sums=('cf09d3a76b468687a38ef61e11e22ed72190c99825ed5cbb1fd20fb8c8c3189d'
            '4f06660e5f31fd822d8a5c2ae6f65e81881098ec03dc84903f9e711ace8cbab2')
license=('custom')

package() {
    install -D -m644 "DPSansMono-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/DPSansMono.ttf"
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
