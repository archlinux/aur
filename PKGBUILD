# Maintainer:
# Contributor: Jonathan Wiersma <archaur AT jon DOT org>
# Contributor: Karl Chen <quarl@nospam.quarl.org>
# Contributor: Jonathan Marten  <jonathan.marten@uk.sun.com>

pkgname=emacs-apache-mode
pkgver=2.0
pkgrel=3
pkgdesc="A major mode for editing apache config files with emacs"
arch=('any')
url="http://www.emacswiki.org/cgi-bin/wiki/apache-mode.el"
license=('GPL')
depends=('emacs')
install=emacs-apache-mode.install
source=("http://www.emacswiki.org/cgi-bin/wiki/download/apache-mode.el")

package() {
  install -D -m644 "${srcdir}"/apache-mode.el "${pkgdir}/usr/share/emacs/site-lisp/apache-mode.el" || return 1
}

md5sums=('881c87994e495588b056769e98048962')
