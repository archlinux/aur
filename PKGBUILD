# Maintainer: reisub0 <reisub0 at gmail dot com>
pkgname=sway-alttab-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Simple Alt-Tab daemon for SwayWM"
arch=('x86_64')
url="https://github.com/reisub0/sway-alttab"
license=('MIT')

depends=('sway'
         'gcc-libs'
         'glibc')

source=('LICENSE::https://raw.githubusercontent.com/reisub0/sway-alttab/master/LICENSE'
        "sway-alttab::https://github.com/reisub0/sway-alttab/releases/download/v$pkgver/sway-alttab")
md5sums=("3c87776c3d12e38215b96b2803959de5"
         "9f8dda1a5ea48db62f343f1bf98394e8")
sha512sums=("248b3dcdc6d5744d418254681afc46d077ac6cb0395b826b328d6d8867803e2683260a881ef8c283be24890dfa13c55b5137b99c06060f67d4413b4544b39935"
            "e17c60807c74d2a4b44f83a90184ab46a9ade1b815de6dfef99b40308bcf2d61817d0e54834fe8df245c4b970989fd28e5baf15895ee7a07bcde2b118dc765fe")

package() {
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/sway-alttab" "${pkgdir}/usr/bin"
}
