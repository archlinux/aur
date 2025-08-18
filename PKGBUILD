# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Anthony Wang <ta180m@proton.me>

pkgname=libretro-meta
pkgver=2025.08.18
pkgrel=1
pkgdesc='Meta package for the libretro group.'
arch=('any')
license=('none')
# pacman -Sg libretro | sed 's/libretro //' | expac -S '%r %n' - | grep -E '^(extra|core) ' | awk '{print "'\''" $2 "'\''"}' | sort | uniq

pkgver() {
	date -u +'%Y.%m.%d'
}

package() {
	depends=(
		'libretro-beetle-pce'
		'libretro-beetle-pce-fast'
		'libretro-beetle-psx'
		'libretro-beetle-psx-hw'
		'libretro-beetle-supergrafx'
		'libretro-blastem'
		'libretro-bsnes'
		'libretro-bsnes2014'
		'libretro-bsnes-hd'
		'libretro-core-info'
		'libretro-desmume'
		'libretro-dolphin'
		'libretro-flycast'
		'libretro-gambatte'
		'libretro-genesis-plus-gx'
		'libretro-kronos'
		'libretro-mame'
		'libretro-mame2016'
		'libretro-melonds'
		'libretro-mesen'
		'libretro-mesen-s'
		'libretro-mgba'
		'libretro-mupen64plus-next'
		'libretro-nestopia'
		'libretro-overlays'
		'libretro-parallel-n64'
		'libretro-picodrive'
		'libretro-play'
		'libretro-ppsspp'
		'libretro-sameboy'
		'libretro-scummvm'
		'libretro-shaders-slang'
		'libretro-snes9x'
		'libretro-yabause'
		'retroarch'
		'retroarch-assets-glui'
		'retroarch-assets-ozone'
		'retroarch-assets-xmb'
	)
}
