# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=netease-music-tui-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.5
pkgrel=1
pkgdesc="Netease cloud music terminal client by rust"
arch=('x86_64')
url="https://github.com/betta-cyber/netease-music-tui"
license=('MIT')
depends=('alsa-lib'
         'openssl')
provides=('netease-music-tui')
conflicts=('netease-music-tui')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz"
        LICENSE::"https://raw.githubusercontent.com/betta-cyber/netease-music-tui/master/LICENSE")
sha256sums=('fce662099cf92d469c001dd20e0e43b1f052fbdd1df346ec96b3b2b466084163'
            '9dfa9048ff73b894cb84a4209f47c40371a3c4824108ce8deb2f18736aec9bd7')
package() {
  install -Dm755 ncmt -t ${pkgdir}/usr/bin/
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim: set sw=2 ts=2 et:
