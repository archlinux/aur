# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.6.1
pkgver=0.6.1
pkgrel=1
pkgdesc='Local-first repository governance assistant with deterministic review readiness'
arch=('x86_64')
url='https://git.sovereign-society.org/Sober/sober'
license=('LSL-1.0')
depends=('tree-sitter')
provides=('sober')
conflicts=('sober')
source=("https://git.sovereign-society.org/Sober/sober/releases/download/v${_upstream_version}/sober_v${_upstream_version}_linux_amd64"
        "https://git.sovereign-society.org/Sober/sober/releases/download/v${_upstream_version}/SHA256SUMS")
sha256sums=('ae645a778c862f1ce0214618e3962ee1941267d927350c1484462ae93a4b929b'
            '304f1647f2e11114927f819dbc2cf503f3f4b0b4d49851015e546a233d7e6dd4')

package() {
    install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
}
