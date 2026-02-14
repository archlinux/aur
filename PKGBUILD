# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=ttf-chocolate-classical-sans
pkgver=1.001
_commit=da53f36e4d09712999369a0f62c698958e5f513c
pkgrel=1
pkgdesc='A traditional Chinese font based on Source Han Sans, featuring inherited glyph forms'
arch=('any')
url='https://github.com/MoonlitOwen/ChocolateSans'
license=('OFL-1.1')
source=("${url}/raw/${_commit}/fonts/ttf/ChocolateClassicalSans-Regular.ttf"
        "${url}/raw/${_commit}/license.md")
sha256sums=('30c7934d8f91b6a10036d50c59c151060e0ce9804952dcf3346e3243b6ca16d3'
            '10468de6821b382bc3e968db376bfe65efbcbadc95b2320311e8023052a8da01')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir}/ChocolateClassicalSans-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${srcdir}/license.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
