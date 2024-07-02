# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=tokyonight-extra
pkgver=4.0.0
pkgrel=1
pkgdesc='A dark and light theme extras for Kitty, Alacritty, iTerm, Fish, etc'
arch=('any')
license=('Apache-2.0')
url='https://github.com/folke/tokyonight.nvim'
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/folke/tokyonight.nvim/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4472b595bafb311eea554291fdb3c86e6c2aacf4d75e3f0f735675e6c31bf6c049b8b82a45c063314fcb3333f2ceae85a25d2bb17b094042e04c7a66810fa3a7')

package() {
	install -dm 755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/tokyonight.nvim-${pkgver}/extras/"* "${pkgdir}/usr/share/${pkgname}/"
}

