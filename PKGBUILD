# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=0.7.1
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
sha256sums=('67893ea9325dfda04c903561447ddf817faa68ec432e1fd038eb412e646e7f76'
            'c3fb163beac8ae1ff1ea4e5c02985a2109e3ce836bf65fa73ece96dd95830978')

package() {
    install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
}
