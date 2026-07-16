# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.6.12
pkgver=0.6.12
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
sha256sums=('a7748a00e4cd64c8d8039bcd130165c1cd98a69fb61c916d6639ba73a3267e20'
            '5e353e5d0e6dda12e142f7e3531ba01a22133a194ee201f06ae974236d904d11')

package() {
    install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
}
