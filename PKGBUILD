# Maintainer: Gerry
# Co-Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=chromium-bypass-paywalls
pkgver=1.8.1
pkgrel=1
pkgdesc='Bypass Paywalls is a web browser extension to help bypass paywalls for selected sites'
arch=('any')
url='https://github.com/iamadamdev/bypass-paywalls-chrome'
license=('unknown')
makedepends=('zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("${url}/releases/download/v${pkgver}/bypass-paywalls-chrome.crx")
sha512sums=('aea12345c1781cc056c000f5b1c55fbed14bf46fa21bc939d6f4c61c484635e81dcdad25b8269e6c38d70266eeb0f5fb2dda5279201c4144bdf3751dc5ed1d03')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   rm "${srcdir}"/bypass-paywalls-chrome.crx
   cp -dr --no-preserve=ownership "${srcdir}"/* "${pkgdir}/usr/share/${pkgname}/"
}
