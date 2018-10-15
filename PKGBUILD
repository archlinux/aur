# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_upstream_pkgname=zenburn-emacs
pkgname=emacs-zenburn-theme
pkgver=2.6
pkgrel=1
pkgdesc='The Zenburn colour theme ported to Emacs'
arch=('any')
url='https://github.com/bbatsov/zenburn-emacs'
depends=('emacs')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bbatsov/zenburn-emacs/archive/v2.6.tar.gz")
sha256sums=('24df671993859dfada2f104f94fdcd2ff81f4df3f72ea811fcbe14cc73688961')

package() {
  cd "${_upstream_pkgname}-${pkgver}"

  install -Dm644 zenburn-theme.el "${pkgdir}/usr/share/emacs/site-lisp/themes/zenburn-theme.el"
}
