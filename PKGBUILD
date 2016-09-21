# Maintainer: Oliver Mangold

pkgname=emacs-markup-faces
pkgver=1.0.0
pkgrel=1
pkgdesc="As font-lock-faces, but tailored for markup languages instead programming languages"
arch=('any')
url="http://github.com/sensorflo/markup-faces"
license=('GPL')
depends=('emacs')
source=(git+http://github.com/sensorflo/markup-faces#commit=c43612633c6c161857a3bab5752ae192bb03f5f3)
md5sums=(SKIP)

package() {
  # Install the mode for Emacs
  install -D -m644 "$srcdir/markup-faces/markup-faces.el" "$pkgdir/usr/share/emacs/site-lisp/markup-faces.el"
}
