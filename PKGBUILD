# Maintainer: Polichronucci <nick AT discloud DOT eu>

pkgname=prosody-mod-onions
pkgver=20161104
_pkgver=2df32ac11b31
pkgrel=1
pkgdesc='s2s communication through TOR'
arch=('any')
url='https://modules.prosody.im/mod_onions.html'
license=('MIT')
depends=('prosody' 'lua51-bitop')

source=("https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_onions/mod_onions.lua")

sha512sums=('e5951aaef2c3278978df543975478e1d900e1be1f84d24546015e086f05ffee1c56818b4857410a71e7d1ad107f48b681ebc91ba757500a837e1a2d9809a1f93')

package() {
  install -Dm 644 'mod_onions.lua' "${pkgdir}/usr/lib/prosody/modules/mod_onions.lua"
}
