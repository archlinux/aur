# Maintainer: kuba09 <kuba09 at protonmail dot com>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.8.38
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('b3241c15d3eef6b811a78d366b444b604a291b881db38223b81677efd1e479fcfe64cf491d3e6f42d25fe6f09fcc02277b8f33d30683afeffe08813e5a398f07')
sha512sums_x86_64=('2444fffff721ffeb9d017cb0b16a46aeecc29c5ce6e58d731ef22293aab7bcbfebcaf178136b4cd8ab1e4958b3b74fbfb3e7a7d07e2c81d5bd4331995e957d90')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"

  install -Dm755 "${pkgdir}/usr/local/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
