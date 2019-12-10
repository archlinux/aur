# Maintainer: reisub0 <reisub0 at gmail dot com>
pkgname=sway-alttab-bin
pkgver=1.1.0
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
         "a3e8212dc2dbf7fe44c5383da698edda")
sha512sums=("248b3dcdc6d5744d418254681afc46d077ac6cb0395b826b328d6d8867803e2683260a881ef8c283be24890dfa13c55b5137b99c06060f67d4413b4544b39935"
            "f217998a2a51d3a472dcd0698debc644536497565f7a72b0bdafc921f3b7d4e13068c71baf6c4574a27fcd5d72f9902ed97cc63115ebf67e0fb6ac2eafc6cf91")

package() {
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/sway-alttab" "${pkgdir}/usr/bin"
}
