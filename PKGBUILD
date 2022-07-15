# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=yor
pkgname=yor-bin
pkgver=0.1.150
pkgrel=1
pkgdesc="Extensible auto-tagger for your IaC files."
arch=('x86_64')
url="https://github.com/bridgecrewio/yor"
license=('Apache')
source=("${url}/releases/download/${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('687ce1bb90742201345791f9fc508cfac65635fcb4ffa2bc03496e8835331971')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
