#!/hint/bash
# shellcheck disable=SC2034  # Unused variables left for readability

# Maintainer: Amirul Fitri <tounghacker@gmail.com>

pkgname=gruvbox-wallpaper
pkgver=20221217
pkgrel=1
pkgdesc="Gruvbox Stripes wallpaper for Archlinux; by u/atlas-ark."
arch=('any')
url=""
license=('Custom')
# https://drive.google.com/drive/folders/1_oz25t_f1KInkb0POKno_YnuowlpTgaQ
source=('gruvbox-dark-archlinux-scalable.svg'
        'gruvbox-dark-archlinux2-scalable.svg'
        'gruvbox-light-archlinux-scalable.svg'
        'gruvbox-light-archlinux2-scalable.svg')
sha256sums=('142a9cb0e31e68813c23dc5f43641750e15e3818eb015ad66de8ec10d3c45212'
            'b15802c046fec96bd6849151c45fa99208497cbb98ee764250cb58e8bef28aaf'
            'ee491ba7e119f94f988f83116b7f4aed7a9429ed850c37b4d9a7842b5cf7036c'
            'b468ef1c154cf741c2c4244276b6d10084d48b3f6b94864d763cb1f4c57c56c6')

package() {
	install -dm755 "${pkgdir:?}"/usr/share/backgrounds/gruvbox
	install -Dm644 "${srcdir:?}"/gruvbox-dark-archlinux-scalable.svg "${pkgdir:?}"/usr/share/backgrounds/gruvbox/
	install -Dm644 "${srcdir:?}"/gruvbox-dark-archlinux2-scalable.svg "${pkgdir:?}"/usr/share/backgrounds/gruvbox/
	install -Dm644 "${srcdir:?}"/gruvbox-light-archlinux-scalable.svg "${pkgdir:?}"/usr/share/backgrounds/gruvbox/
	install -Dm644 "${srcdir:?}"/gruvbox-light-archlinux2-scalable.svg "${pkgdir:?}"/usr/share/backgrounds/gruvbox/
}
