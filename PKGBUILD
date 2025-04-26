# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='buildg'
pkgver=0.5.2
pkgrel=1
pkgdesc='Interactive debugger for Dockerfile, with support for IDEs (VS Code, Emacs, Neovim, etc.)'
url='https://github.com/ktock/buildg'
depends=('runc')
optdepends=('rootlesskit: rootless execution' 'slirp4netns: rootless execution')
license=('Apache-2.0')
arch=('x86_64')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('70371949ac56d118e55306091640e63537069a538a97c151eb7475c07cb5a8a4')

package() {
  install -Dm755 buildg "$pkgdir/usr/bin/buildg"
}
