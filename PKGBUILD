# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_upstream_pkgname=zenburn-emacs
pkgname=emacs-zenburn-theme
pkgver=2.5
pkgrel=1
pkgdesc='The Zenburn colour theme ported to Emacs'
arch=('any')
url='https://github.com/bbatsov/zenburn-emacs'
depends=('emacs')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bbatsov/zenburn-emacs/archive/v2.5.tar.gz")
sha256sums=('f6811eada38ad53e233f53872a0ab9b5264978c7c6cfffef8e88aeb5de876e0e')

package() {
  cd "${_upstream_pkgname}-${pkgver}"

  install -Dm644 zenburn-theme.el "${pkgdir}/usr/share/emacs/site-lisp/themes/zenburn-theme.el"
}
