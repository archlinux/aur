# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=peco
pkgver=0.4.2
pkgrel=1
pkgdesc='Simplistic interactive filtering tool'
arch=('x86_64' 'i686')
url='https://github.com/peco/peco'
license=('MIT')
source_x86_64=("https://github.com/peco/peco/releases/download/v${pkgver}/peco_linux_amd64.tar.gz")
source_i686=("https://github.com/peco/peco/releases/download/v${pkgver}/peco_linux_386.tar.gz")
md5sums_x86_64=('b20bfaf869e456447d523aca5b05c91c')
md5sums_i686=('5651a014b1c3ad85139c2dd9eb814395')


package() {
  [[ "$arch" == "x86_64" ]] && cd "${pkgname}_linux_amd64" || cd "${pkgname}_linux_386"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

