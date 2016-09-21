# Maintainer: Oliver Mangold

pkgname=emacs-adoc-mode
pkgver=0.6.6
pkgrel=1
pkgdesc="Emacs major mode for editing asciidoc files"
arch=('any')
url="http://github.com/sensorflo/adoc-mode"
license=('GPL')
depends=('emacs' "emacs-markup-faces>=1.0.0")
install=emacs-adoc-mode.install
source=(git+http://github.com/sensorflo/adoc-mode#commit=995785538489e573ad208f73c4e833ba60c5cfdb)
md5sums=(SKIP)

package() {
  # Install the mode for Emacs
  install -D -m644 "$srcdir/adoc-mode/adoc-mode.el" "$pkgdir/usr/share/emacs/site-lisp/adoc-mode.el"
}
