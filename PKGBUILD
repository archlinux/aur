# Maintainer: Aaron Liu <aaronliu0130📧gmail.com>
# Contributor: Rocket Aaron <i at rocka dot me>

pkgname=ttf-blobmoji2
pkgver=17r1
pkgrel=1
pkgdesc='Fork and continuation of Noto Emoji 7.0, known for its blob/gumdrop-like faces (installed as "Noto Color Emoji")'
arch=(any)
url='https://github.com/DavidBerdik/blobmoji2'
license=('OFL-1.1')
provides=(emoji-font noto-fonts-emoji-blob=17 noto-fonts-emoji)
conflicts=(noto-fonts-emoji)
source=("${url}/releases/download/blobmoji-${pkgver}/NotoColorEmoji.ttf")
sha256sums=('ffc75f156f65027d61ea976b7ef6327641403913c89812371a3d064fd15c67f2')

package() {
  install -Dm644 NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto/NotoColorEmoji.ttf
}
