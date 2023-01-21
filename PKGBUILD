# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=git-trim-bin
_realname="${pkgname%-bin}"
pkgver=0.4.3
pkgrel=1
pkgdesc="Trims your git remote tracking branches"
arch=('x86_64')
url="https://github.com/foriequal0/${_realname}"
license=("MIT")
provides=("git-trim")
depends=("libgit2")
source=("https://github.com/foriequal0/git-trim/releases/download/v${pkgver}/git-trim-linux-v${pkgver}.tgz")
sha256sums=('691be95a0e77e7dbdd2b5aa00810bf3b3a0a9cfe43849d80f7508461fc5c24e8')

package() {
  cd "${srcdir}/"
  install -Dm755 "git-trim/git-trim" "${pkgdir}/usr/bin/git-trim"
}
