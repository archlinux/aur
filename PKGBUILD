# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Laszlo Papp <djszapi @ archlinux us>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

_name=gnupg
pkgname=vim-${_name}
pkgver=2.6.1
pkgrel=1
pkgdesc="Plugin for transparent editing of gpg encrypted files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3645"
license=('GPL2')
groups=('vim-plugins')
depends=('vim')
source=("${_name}.vim::https://www.vim.org/scripts/download_script.php?src_id=26175")
sha256sums=('9e57ed1cdf4c09fa1949c164622c0023888b436b7b0fed6d41e729997806e7da')

package() {
    install -Dm644 "${srcdir}/${_name}.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/${_name}.vim"
}

# vim:set ts=2 sw=2 et:
