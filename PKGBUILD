# Maintainer: Polichronucci <nick AT discloud DOT eu>

pkgname=prosody-mod-onions
pkgver=20180216
_pkgver=824b0d7fa883
pkgrel=1
pkgdesc='s2s communication through TOR'
arch=('any')
url='https://modules.prosody.im/mod_onions.html'
license=('MIT')
depends=('prosody' 'lua51-bitop' 'tor')

source=("https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_onions/mod_onions.lua")

sha512sums=('eaaf188bbc4124cd1e31ca24a0846bba00a9ad6407154b99a86e65f1a748651a2198b2ff759b15b62e2956220fd1c5bd50f0d0f0761bbde1e477e12c2b4b367d')

package() {
  install -Dm 644 'mod_onions.lua' "${pkgdir}/usr/lib/prosody/modules/mod_onions.lua"
}
