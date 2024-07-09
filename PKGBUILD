# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=tokyonight-extra
pkgver=4.4.0
pkgrel=1
pkgdesc='A dark and light theme extras for Kitty, Alacritty, iTerm, Fish, etc'
arch=('any')
license=('Apache-2.0')
url='https://github.com/folke/tokyonight.nvim'
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/folke/tokyonight.nvim/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9ae3553017369d08235789b624b3a6135191c92729b4e96a3ef9c0140c00fa1c8303b8349d51094a0cbf28bdbc4611f96a021febf8fa36f9eb0b5d9dfc7a46b8')

package() {
	install -dm 755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/tokyonight.nvim-${pkgver}/extras/"* "${pkgdir}/usr/share/${pkgname}/"
}

