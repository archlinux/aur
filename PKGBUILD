#!/usr/bin/env zsh
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.0.1
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('GPL3')
depends=('python-dateutil' 'gcalcli')
source=( ${url}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('1f02433f4c0c1493fd6065e84edcbc15120705450b005f36ad184245aeb32075')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m0755 -Dp ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
