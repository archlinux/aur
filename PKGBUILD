# Maintainer: <ipha00@gmail.com>

pkgname=noto-fonts-emoji-blob
_pkgver=2018-04-08
_emojiver=11
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Google Noto emoji fonts (blob version, C1710's fork)"
arch=(any)
url="https://github.com/C1710/blobmoji/"
license=("Apache")
depends=(fontconfig)
provides=(noto-fonts-emoji)
conflicts=(noto-fonts-emoji)
source=("https://github.com/C1710/blobmoji/releases/download/v-${_pkgver}-emoji-${_emojiver}/NotoColorEmoji.ttf")
sha256sums=('a65a77aeaa042c27340910b094ae15e583f59a98684739b6d93a91335d330b34')

package() {
    mkdir -p "$pkgdir"/usr/share/fonts/noto
    install -m644 NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
}
