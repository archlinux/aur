# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=tokyonight-extra
pkgver=4.10.0
pkgrel=1
pkgdesc='A dark and light theme extras for Kitty, Alacritty, iTerm, Fish, etc'
arch=('any')
license=('Apache-2.0')
url='https://github.com/folke/tokyonight.nvim'
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/folke/tokyonight.nvim/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('594b4c0b6ef20b553d6a7609c41ee06a5f530c1fdd91345d5a578304bbd90bded0328c17f2847809dd1ac7932b635847a9864b973714e0fdc7602c3b806db70b')

package() {
	install -dm 755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/tokyonight.nvim-${pkgver}/extras/"* "${pkgdir}/usr/share/${pkgname}/"
}

