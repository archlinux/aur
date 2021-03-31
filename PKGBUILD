pkgname=chromium-bypass-paywalls
pkgver=1.7.9
pkgrel=1
pkgdesc='Bypass Paywalls is a web browser extension to help bypass paywalls for selected sites'
arch=('any')
url='https://github.com/iamadamdev/bypass-paywalls-chrome'
license=('unknown')
makedepends=('zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("https://github.com/iamadamdev/bypass-paywalls-chrome/releases/download/v${pkgver}/bypass-paywalls-chrome.crx")
sha256sums=('77f6c61f40bb78b6c4a412ae3e029a7274e4ea5601d8e7bcef1c74a75051ad75')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   rm "${srcdir}"/bypass-paywalls-chrome.crx
   cp -dr --no-preserve=ownership "${srcdir}"/* "${pkgdir}/usr/share/${pkgname}/"
}
