# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=nord-emacs
pkgver=0.5.0
pkgrel=1
pkgdesc="An arctic, north-bluish clean and elegant Emacs theme"
arch=("any")
url="https://github.com/arcticicestudio/nord-emacs"
license=("MIT")
depends=("emacs>=23")
makedepends=("git")
source=("$pkgname::git+https://github.com/arcticicestudio/nord-emacs.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "$pkgdir/usr/share/emacs/site-lisp/themes"
  install -Dm644 "nord-theme.el" "$pkgdir/usr/share/emacs/site-lisp/themes"
}
