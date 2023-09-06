#!/usr/bin/env zsh
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.0.2
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('GPL3')
depends=('python-dateutil' 'gcalcli')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('f72b8c8ded28b61b7a0dcbd6b62c39c566fe4bb331ea195bb0e74f410e07fbf2')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -m0755 -Dp ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
