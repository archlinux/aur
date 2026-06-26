# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.5.2
pkgver="${_upstream_version//-/_}"
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
sha256sums=('b2ba95da309a11002b6dbecdfb70f0716d71d38bc54e73525ea41185770c1505'
            '5ee564c03eeb545a5566f32dabd09f4cdf9ae6f8b0f84acdf6371c5d9a453443')

package() {
    install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
}
