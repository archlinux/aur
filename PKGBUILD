# Maintainer: Misakait <cjl2597588144@gmail.com>
pkgname=warp-refined-bin
_pkgname=warp-terminal-oss
pkgver=0.2026.05.22.11.32.oss_00
pkgrel=1
pkgdesc="Warp Refined is an agentic development environment, born out of the terminal. "
arch=('x86_64')
url="https://github.com/cesaryuan/warp-refined"
license=('AGPL-3.0 license')
provides=('warp-refined' 'warp-terminal')
conflicts=('warp-refined')
options=('!strip')

source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('b30607f2caf871433e17f64df66348fbfd27339dedb7a6fd5a20b0b2ceda0833')

package() {
    cd "$srcdir"

    if [ -d "usr" ]; then
        cp -a usr "$pkgdir/"
    fi

    if [ -d "opt" ]; then
        cp -a opt "$pkgdir/"
    fi
}
