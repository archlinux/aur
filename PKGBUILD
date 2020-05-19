# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joshua Li <josh@jrl.ninja>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
url="https://github.com/JoshuaRLi/vape"
license=('MIT')
provides=('vape')
options=('!strip')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/vape-x86_64-unknown-linux-gnu"
        'LICENSE::https://github.com/joshuarli/vape/raw/master/LICENSE')
sha256sums=('7a557fcd648d2e52c3320b2c43ce5c56afa6438e69284e72509238c25a90f20f'
            '3ceac5a0c3f1e5311aeb9eb7c8ce06ace3f5031066ac61a433c8e7e090406fca')

package () {
  install -Dm755 "$srcdir"/${pkgname}-${pkgver} "${pkgdir}/usr/bin/vape"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}