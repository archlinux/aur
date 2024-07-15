# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=tokyonight-extra
pkgver=4.6.0
pkgrel=1
pkgdesc='A dark and light theme extras for Kitty, Alacritty, iTerm, Fish, etc'
arch=('any')
license=('Apache-2.0')
url='https://github.com/folke/tokyonight.nvim'
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/folke/tokyonight.nvim/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ffcc086e92e0624d93790438a7229f4d4980016ed0f09a3e6026e4ae5f7c584fec7165df5d92db3177769c35750c30e36746915d026c6293ad4c340a5192c89e')

package() {
	install -dm 755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/tokyonight.nvim-${pkgver}/extras/"* "${pkgdir}/usr/share/${pkgname}/"
}

