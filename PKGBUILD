# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Laszlo Papp <djszapi @ archlinux us>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

pkgname=vim-gnupg
pkgver=2.5
_scriptid=18070
pkgrel=2
pkgdesc="Plugin for transparent editing of gpg encrypted files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3645"
license=('GPL2')
groups=('vim-plugins')
depends=('vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('2cfc15c4a73f4d5ab7de55e24ee82458')

package() {
    install -Dm644 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/plugin/gnupg.vim
}

# vim:set ts=2 sw=2 et:
