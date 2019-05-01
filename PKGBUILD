# Maintainer: kuba09 <kuba09 at protonmail dot com>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.8.39
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('b401d6d7812283dc432c667cc31849ba26f576649d177394c9489e4dc46842fc06732c87f89c604370e89f20ccf56e76aee9d9ae38fc067bb78daab4e3ad64b1')
sha512sums_x86_64=('2228616d6e1efe6099f28e80a69d2f50b8116e76ae024a921b80e5cc4650060d550f36ca06713e08976050ee76546e775167b475e807a5e3fea2aa31fb79c6d1')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"

  install -Dm755 "${pkgdir}/usr/local/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
