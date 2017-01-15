# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Laszlo Papp <djszapi @ archlinux us>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

pkgname=vim-gnupg
pkgver=2.6
_scriptid=24199
pkgrel=1
pkgdesc="Plugin for transparent editing of gpg encrypted files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3645"
license=('GPL2')
groups=('vim-plugins')
depends=('vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('3770b532ddff0aa8e77396dc7016b9ae')

package() {
    install -Dm644 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/gnupg.vim
}

# vim:set ts=2 sw=2 et:
