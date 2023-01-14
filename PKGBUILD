# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='buildg'
pkgver=0.4.1
pkgrel=1
pkgdesc='Interactive debugger for Dockerfile, with support for IDEs (VS Code, Emacs, Neovim, etc.)'
url='https://github.com/ktock/buildg'
depends=('runc')
optdepends=('rootlesskit: rootless execution' 'slirp4netns: rootless execution')
license=('Apache')
arch=('x86_64')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('87d047c4742b904e9f0f48427aec5cd157dc96ea97cd89e3ff5b1db171c6eb5e')

package() {
  install -Dm755 buildg "$pkgdir/usr/bin/buildg"
}
