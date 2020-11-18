# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joshua Li <josh@jrl.ninja>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
url="https://github.com/JoshuaRLi/vape"
license=('MIT')
provides=('vape')
options=('!strip')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/vape-x86_64-unknown-linux-gnu"
        'LICENSE::https://github.com/joshuarli/vape/raw/master/LICENSE')
sha256sums=('d3e8c1e2262846c9ca8ed0b8e77917121d63fa9bd4946784d461c1cac41f8e9f'
            '3ceac5a0c3f1e5311aeb9eb7c8ce06ace3f5031066ac61a433c8e7e090406fca')

package () {
  install -Dm755 "$srcdir"/${pkgname}-${pkgver} "${pkgdir}/usr/bin/vape"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
