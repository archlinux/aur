# Maintainer: Christopher Ferreira <aumgn@free.fr>

pkgname=gitbatch-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A TUI to manage your git repositories in one place"
url="https://github.com/isacikgoz/gitbatch"
license=('MIT')
arch=('x86_64')

source_x86_64=(https://github.com/isacikgoz/gitbatch/releases/download/v${pkgver}/gitbatch_${pkgver}_linux_amd64.tar.gz)
sha512sums_x86_64=('02e38924b3420380f804f699f85392e429534d1a620e9ec70348419cc8c94b841ca561c763b5f23b9c0b780df082c2c67ea93e7d1923e8a3aa5b2dd9f50ed671')

package() {
  tar xzf ${srcdir}/gitbatch_${pkgver}_linux_amd64.tar.gz
  install -Dm755 ${srcdir}/gitbatch "${pkgdir}/usr/bin/gitbatch"
}
