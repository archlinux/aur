# Maintainer: archelinux maintainers (https://github.com/archelinux/arch-tools/issues)
# SPDX-License-Identifier: 0BSD
pkgname=neovim-archevim
pkgver=2.0.0
pkgrel=1
pkgdesc='archelinux dark colorscheme for Neovim and matching lualine theme'
arch=('any')
url='https://archelinux.github.io/archelinux.org/wiki/arch-tools.html'
license=('GPL-3.0-only')
depends=('neovim')
_source='https://raw.githubusercontent.com/archelinux/archelinux/259faec1ae8a8e2453709bfee72cd4f98958b5f6/airootfs/etc/skel/.config/nvim'
source=("archevim-$pkgver.lua::$_source/colors/archevim.lua"
        "archevim-lualine-$pkgver.lua::$_source/lua/lualine/themes/archevim.lua")
sha256sums=('d062fe8b368d52836855bc8180761bca05a2f423d9e5fdb33a824378820f013a'
            '50c8b97872c9fca42b9f4d59e715998f18b5418d9734c32a2937f137465d58aa')

package() {
  install -Dm644 "$srcdir/archevim-$pkgver.lua" "$pkgdir/usr/share/nvim/site/colors/archevim.lua"
  install -Dm644 "$srcdir/archevim-lualine-$pkgver.lua" "$pkgdir/usr/share/nvim/site/lua/lualine/themes/archevim.lua"
}
