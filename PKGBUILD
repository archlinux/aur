# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=tokyonight-extra
pkgver=3.0.1
pkgrel=1
pkgdesc='A dark and light theme extras for Kitty, Alacritty, iTerm, Fish, etc'
arch=('any')
license=('Apache-2.0')
url='https://github.com/folke/tokyonight.nvim'
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/folke/tokyonight.nvim/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c9a24ed5476b35714d071b27c15c8cec773e748d466ff7d7f143d132132761e1361ad5ead1c988e415776b102b1051c78c96a4c26702a388454d977fb2b51c64')

package() {
	install -dm 755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/tokyonight.nvim-${pkgver}/extras/"* "${pkgdir}/usr/share/${pkgname}/"
}

