# Maintainer: bruhgdser-cloud <akkauntschaem@gmail.com>
pkgname=cool-rain
pkgver=1.0.0
pkgrel=1
pkgdesc="Very cool and fun ASCII rain animation for your terminal"
arch=('any')
url="https://github.com"
license=('MIT')
depends=('bash' 'ncurses')
source=("cool-rain::https://github.com/bruhgdser-cloud/cool-rain.git")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/cool-rain" "${pkgdir}/usr/bin/cool-rain"
}
