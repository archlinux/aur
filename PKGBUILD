# Maintainer: Yang Bai <hamo.by@gmail.com>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=auto-complete-clang-async-bin
pkgver=20140918
pkgrel=1
pkgdesc="emacs-clang-complete-async is an emacs extension to complete C and C++ code, it uses libclang to parse the source code on the fly and provides completion candidates to auto-complete (binary only)"
arch=('i686' 'x86_64')
url="https://github.com/Golevka/emacs-clang-complete-async"
license=('GPL')
depends=('clang')
makedepends=('git')
source=("git+https://github.com/Golevka/emacs-clang-complete-async.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/emacs-clang-complete-async"
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"

  cp "${srcdir}/emacs-clang-complete-async/clang-complete" "${pkgdir}/usr/bin"
}
