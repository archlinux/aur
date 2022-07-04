# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='buildg'
pkgver=0.3.0
pkgrel=1
pkgdesc='Interactive debugger for Dockerfile, with support for IDEs (VS Code, Emacs, Neovim, etc.)'
url='https://github.com/ktock/buildg'
depends=('runc')
optdepends=('rootlesskit: rootless execution' 'slirp4netns: rootless execution')
license=('Apache')
arch=('x86_64')
conflicts=("")
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c57faadd382ae19a48fb6f3e46aa440b6fdb71bc0eaac49080216e9a23371302')

package() {
  install -Dm755 buildg "$pkgdir/usr/bin/buildg"
  install -Dm755 buildg.sh "$pkgdir/usr/bin/buildg.sh"
}
