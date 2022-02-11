# Maintainer: heersin <teablearcher at gmail dot com>
# Contributor: heersin <teablearcher at gmail dot com>
# Submitter: heersin <teablearcher at gmail dot com>

pkgname=vim-plug-neo
pkgver=0.11.0
pkgrel=1
pkgdesc="A minimalist Vim plugin manager. (install for neovim user)"
arch=('any')
url="http://github.com/junegunn/vim-plug"
depends=('neovim')
license=('MIT')
conflicts=(
	'neovim-plug-git'
	'neovim-plug'
)
provides=('vim-plug-neo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"sample.init.vim"
	)

sha256sums=('b313ac61f9deffca9e6cb2dabd2cc13716d5fe8dafaab5e5c97dc2820fd50dbd'
            '1eecd04a72dd5556dfa2f551378839a1f1af79817565590c98fede04b5ea034f')

install=${pkgname}.install

package() {
  install -Dm 644 ${pkgname}-${pkgver}/plug.vim ${pkgdir}/usr/share/nvim/site/autoload/plug.vim
  install -Dm 644 sample.init.vim ${pkgdir}/usr/share/vim-plug/sample.init.vim
}


