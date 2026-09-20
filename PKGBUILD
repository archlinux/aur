# Maintainer: GaKu999 <gaku999 [at] posteo [dot] net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# vim:ft=PKGBUILD:noet:ts=3:sw=3:

pkgname=retroarch-assets-sounds
pkgver=1.22.0
pkgrel=1
epoch=1
pkgdesc='XMB menu sounds for RetroArch'
arch=(any)
url=http://www.libretro.com/
license=(CC-BY-NC-3.0)
groups=(libretro)
depends=()
makedepends=()
source=(
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/Licence.txt"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/README.md"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/bgm.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/cancel.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/down.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/launch.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/notice.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/notice_back.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/ok.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/unlock.ogg"
	"https://github.com/libretro/retroarch-assets/raw/refs/tags/v$pkgver/sounds/up.ogg"
)
sha256sums=(
	'ae3a9d8528662dadee2538e27211e8a50d0577b8131de7c25547669aa9878c6f'
	'4daed2bf50161e8eea40b22e2cd532cd2cebdc944d605dd706209f5bc79dd21f'
	'62c828f0ecdc9f50d9e0ce17d262d99d3db8ba6d8af053dcae75dd4e78218b80'
	'91f3df01bfb3d5f1871aa36d485bb0f7dd24358d8de51efe017f2f4f98ff297c'
	'6eab3296c1dd94e777f77a5ad2d076f4dd1f3fa812a80047d80713a6efb0c8be'
	'eaa697673d69e4e94db9e8fd55cbc9661d11b5511e3d9bfc157436705a7b33c9'
	'2047783affd6cf70ac527a9f0ff15ee98609f80bdf26dcfd5439d415979b6606'
	'77a6b731aedf59f9a7185fb20d0fedc7409b0b2f2a39de33dd4b8cde54e6551b'
	'57e61f165fcca9a6a68554138a84ec208fef577e9a842e2e319d4b85b9cd3584'
	'8f8b44fb686399ff61b7f40daff88ad6090005d959ab1f946279b728215eeecb'
	'b3b42f8b5b3e5385bdcff205abdff7d30b539a456270ea80e03d99d8e1040860'
)

package() {
	install -dm 755 "${pkgdir}"/usr/share/retroarch/assets/sounds
	install -m 644 -t "${pkgdir}"/usr/share/retroarch/assets/sounds Licence.txt README.md *.ogg
}
