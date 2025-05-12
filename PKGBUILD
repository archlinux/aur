# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='buildg'
pkgver=0.5.3
pkgrel=1
pkgdesc='Interactive debugger for Dockerfile, with support for IDEs (VS Code, Emacs, Neovim, etc.)'
url='https://github.com/ktock/buildg'
depends=('runc')
optdepends=('rootlesskit: rootless execution' 'slirp4netns: rootless execution')
license=('Apache-2.0')
arch=('x86_64')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c289a454ae8673ff99acf56dec9ba97274c20d2015e80f7ac3b8eb8e4f77888f')

package() {
  install -Dm755 buildg "$pkgdir/usr/bin/buildg"
}
