appname="zen-adblocker"
pkgname="${appname}"-bin
pkgver="0.1.1"
pkgrel=2
pkgdesc="An open-source system-wide ad-blocker and privacy guard"
arch=('x86_64')
url="https://github.com/anfragment/zen"
license=('MIT')
conflicts=('zen-adblocker')
source_x86_64=("https://github.com/anfragment/zen/releases/latest/download/Zen_linux_amd64.tar.gz")
sha256sums_x86_64=('f2f446a484cea79333a08a6c7297ae5f3505eed52dc5ead67945a514639d641d')

package() {
    install -Dm755 "${srcdir}/Zen" "${pkgdir}/usr/bin/${appname}"
    install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${startdir}/${appname}.desktop" "${pkgdir}/usr/share/applications/${appname}.desktop"
    install -Dm644 "${startdir}/appicon.png" "${pkgdir}/usr/share/pixmaps/${appname}.png"
}
