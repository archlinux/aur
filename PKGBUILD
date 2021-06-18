# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Laszlo Papp <djszapi @ archlinux us>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

_name=gnupg
pkgname=vim-${_name}
pkgver=2.7.1
pkgrel=2
pkgdesc="Plugin for transparent editing of gpg encrypted files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3645"
license=('GPL2')
groups=('vim-plugins')
depends=('vim')
source=("${_name}.zip::https://www.vim.org/scripts/download_script.php?src_id=27359")
sha256sums=('4c6731e3bbf00231096b9c09c38c517e22451eb408378e3206e70f601d75d56c')

package() {
    mkdir -p "${pkgdir}/usr/share/vim/vimfiles/plugin"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/vim/vimfiles/plugin"
}

# vim:set ts=2 sw=2 et:
