pkgname=chromium-bypass-paywalls
pkgver=1.7.8
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
md5sums=('67b50b884755a48f899d666cb9043334')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   rm "${srcdir}"/bypass-paywalls-chrome.crx
   cp -dr --no-preserve=ownership "${srcdir}"/* "${pkgdir}/usr/share/${pkgname}/"
}
