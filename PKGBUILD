# Maintainer: Enrico Lovisotto <enricolovisotto@gmail.com>
pkgname=emacs-anywhere-git
_pkgname=emacs-anywhere
pkgver=1.0
pkgrel=1
pkgdesc='Edit any text using Emacs (git version)'
arch=('any')
url='https://github.com/lobisquit/emacs-anywhere'
license=('MIT')
depends=('xclip' 'xdotool')
makedepends=('git')
options=(!emptydirs)
provides=('emacs-anywhere')
conflicts=('emacs-anywhere')

source=("git+${url}.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m755 bin/emacstask     ${pkgdir}/usr/share/${_pkgname}/emacstask
    install -D -m755 bin/linux         ${pkgdir}/usr/bin/emacs-anywhere
    install -D -m755 emacs_anywhere.el ${pkgdir}/usr/share/${_pkgname}/emacs_anywhere.el
}

# vim:set ts=2 sw=2 et:
