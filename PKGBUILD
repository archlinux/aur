# Maintainer: <ipha00@gmail.com>

pkgname=noto-fonts-emoji-blob
_pkgver=2018-05-06
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Google Noto emoji fonts (blob version, C1710's fork)"
arch=(any)
url="https://github.com/C1710/blobmoji/"
license=("Apache")
depends=(fontconfig)
provides=(noto-fonts-emoji)
conflicts=(noto-fonts-emoji)
source=("https://github.com/C1710/blobmoji/raw/8b754e03bd3b2b82dd2a35632b73965fafb20ff3/fonts/NotoColorEmoji.ttf")
sha256sums=('271f6f8a54cc9538b17d86810da21605e602200c044e10bab1662c8c5995fafd')

package() {
    mkdir -p "$pkgdir"/usr/share/fonts/noto
    install -m644 NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
}
