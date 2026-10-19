# Maintainer: p0358

pkgname=otf-antykwa-poltawskiego
pkgver=1.101
pkgrel=1
pkgdesc="A typeface designed by Adam Półtawski. It was widely used by Polish printing houses as long as metal types were in use (until ca the sixties)."
url="http://jmn.pl/en/antykwa-poltawskiego"
license=("custom:GUST-FONT-LICENSE")
arch=("any")
source=(
    "ap${pkgver}otf.zip::https://jmn.pl/download/ap${pkgver}otf.zip"
    "GUST-FONT-LICENSE.txt::https://jmn.pl/GUST-FONT-LICENSE.txt"
)
sha256sums=('0e13bd202a95da792fc9147c53b69b57b6d67fcd02d9412a74e87360b4f669c9'
            'a746108477b2fa685845e7596b7ad8342bc358704b2b7da355f2df0a0cb8ad85')

package() {
    install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF/ *.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname GUST-FONT-LICENSE.txt
}
