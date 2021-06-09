# Maintainer: Alley_Cat <read_only@gmx.us>
#
# Contributor: Alley_Cat <read_only@gmx.us>
#
pkgname="opera-proxy"
pkgver="1.2.2"
pkgrel="1"
pkgdesc="Standalone Opera VPN client."
url="https://github.com/Snawoot/opera-proxy"
license=('MIT')
arch=('i686' 'x86_64')
provides=("${pkgname}")
source=("https://github.com/Snawoot/"${pkgname}/releases/download/"v${pkgver}/${pkgname}.linux-amd64")
sha512sums=('6874d055c0a6c5f44cdb37d4c136d2aaf11218e0d2e38cea8e0fd16ff6c62fb1071e420c7818797585729ad61692c776c7b8161ee9bb42bf1ee983f303d988df')

package() {
    cd "${srcdir}"
    install -Dm755 opera-proxy.linux-amd64 "${pkgdir}/usr/bin/opera-proxy"
}

# vim:set ts=4 sw=2 ft=sh et:
