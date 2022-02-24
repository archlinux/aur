# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=git-trim-bin
_realname="${pkgname%-bin}"
pkgver=0.4.2
pkgrel=1
pkgdesc="Trims your git remote tracking branches"
arch=('x86_64')
url="https://github.com/foriequal0/${_realname}"
license=("MIT")
provides=("git-trim")
depends=("libgit2")
source=("https://github.com/foriequal0/git-trim/releases/download/v${pkgver}/git-trim-linux-v${pkgver}.tgz")
sha256sums=('5f8d64dca386fbdc5807caa8f4ce77fb149bc6f6bb1b2c90b200c834a24c9534')

package() {
  cd "${srcdir}/"
  install -Dm755 "git-trim/git-trim" "${pkgdir}/usr/bin/git-trim"
}
