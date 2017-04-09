# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=vim-easymotion
pkgver=3.0.1
pkgrel=2
pkgdesc='simpler and faster vim motions'
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3526"
license=('unknown')
depends=('vim-runtime')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/easymotion/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8d9349eb4c558cf2d86ea696e8d99f7720542e206b87e6e21073eacb79dbb89669cba24feecc54006c3f374afcc9bb8156f7eb4424df8bd00ef659c4a4df335c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"
  cp -r autoload doc plugin t "${pkgdir}/usr/share/vim/vimfiles/"
}
# vim:set ts=2 sw=2 et:
