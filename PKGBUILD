#!/usr/bin/env zsh
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.0.0
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('GPL3')
depends=('python-dateutil' 'gcalcli')
source=( ${url}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('a148dbf7b70d3ffd6befd04122ded489040ea50355db790bbe67a0c20c1386eb')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m0755 -Dp ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
