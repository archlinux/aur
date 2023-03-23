# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weektodo
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=2
pkgdesc="WeekToDo is a Free and Open Source Weekly Planner. Stop prioritizing what's on your schedule and start scheduling your priorities."
arch=("x86_64")
url="https://weektodo.me/"
_githuburl="https://github.com/manuelernestog/weektodo"
license=(GPL3)
depends=(nss gtk3 alsa-lib at-spi2-core)
options=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/WeekToDo-${pkgver}.pacman")
sha256sums=('8e9197b515f1bf55d169562d1c1e1b1c711cd0cecc11c3185e4ac8312b9f228f')
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}