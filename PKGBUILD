# Maintainer: Polichronucci <nick AT discloud DOT eu>

pkgname=prosody-mod-onions
pkgver=20151014
_pkgver=720b291cb340
pkgrel=1
pkgdesc='s2s communication through TOR'
arch=('any')
url='https://modules.prosody.im/mod_onions.html'
license=('MIT')
depends=('prosody' 'lua51-bitop')

source=("https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_onions/mod_onions.lua")

sha512sums=('60a2eec49a9305ab55185a642195827a50891213f1c70a320aa33116e360f38f13d31491c4a9fb6b55260292694e57b58c94d66ec442709a455ab45d8eafd25b')

package() {
  install -Dm 644 'mod_onions.lua' "${pkgdir}/usr/lib/prosody/modules/mod_onions.lua"
}
