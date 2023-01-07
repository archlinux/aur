# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dingtalk-sans
pkgname=ttf-dingtalk-sans
pkgver=1.0.0
pkgrel=0
pkgdesc="钉钉进步体 dingtalk jinbuti"
url="https://page.dingtalk.com/wow/dingtalk/default/dingtalk/y-W5aF3_ZJwzulU0nceIl"
depends=()
license=("commercial")
arch=(any)
source=(
    "${pkgbase}-${pkgver}.zip::https://files.alicdn.com/tpsservice/0f4e697671849694f93f0df8ebddf0d2.zip"
)

sha256sums=('dc6e2685e1d7b72e2e010c14ac3b5f00822fb4ae03285b99383104c5fda997bb')

package() {
    install -dm755 "$pkgdir/usr/share/fonts/TTF" \
                    "$pkgdir/usr/share/licenses/${pkgname}"

    cd "${srcdir}/钉钉进步体"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 钉钉进步体法律声明.pdf "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
