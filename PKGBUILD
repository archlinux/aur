# Maintainer: Misakait <cjl2597588144@gmail.com>
pkgname=warp-refined-bin
_pkgname=warp-terminal-oss
pkgver=0.2026.05.18.07.14.oss_00
pkgrel=1
pkgdesc="Warp Refined is an agentic development environment, born out of the terminal. "
arch=('x86_64')
url="https://github.com/cesaryuan/warp-refined"
license=('AGPL-3.0 license')
provides=('warp-refined' 'warp-terminal')
conflicts=('warp-refined')
options=('!strip')

source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('6eb861f6e555f825b5114a61f6283db89a1198edaf94e105de010f109c31049e')

package() {
    cd "$srcdir"

    if [ -d "usr" ]; then
        cp -a usr "$pkgdir/"
    fi

    if [ -d "opt" ]; then
        cp -a opt "$pkgdir/"
    fi
}
