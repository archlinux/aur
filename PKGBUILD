# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gomplate-bin
pkgver=3.6.0
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering. Supports lots of local and remote datasources'
arch=('x86_64')
url="https://gomplate.ca"
license=('MIT')
provides=('gomplate')
source=("https://github.com/hairyhenderson/gomplate/releases/download/v${pkgver}/gomplate_linux-amd64")
md5sums=('7039b07e5b5130b1bc8ee378f5d2eec4')

package() {
  cd "${srcdir}"
  install -Dm755 gomplate* "${pkgdir}/usr/bin/gomplate"
}
# vim:set ts=2 sw=2 et: