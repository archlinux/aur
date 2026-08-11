# Maintainer: leeteral <kneesdev@naver.com>

pkgname=speedtest
pkgver=1.2.0
pkgrel=1
pkgdesc="Official Ookla Speedtest CLI for personal, non-commercial use"
arch=('x86_64')
license=('custom')
conflicts=('speedtest-cli')
url="https://www.speedtest.net/"
options=('!strip' '!debug')

source=("ookla-speedtest-${pkgver}-linux-x86_64.tgz::https://install.speedtest.net/app/cli/ookla-speedtest-${pkgver}-linux-x86_64.tgz")
sha256sums=('5690596c54ff9bed63fa3732f818a05dbc2db19ad36ed68f21ca5f64d5cfeeb7')
package() {
    install -Dm755 speedtest "${pkgdir}/usr/bin/speedtest"
}
