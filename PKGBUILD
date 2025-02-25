# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=atmos-bin
pkgver=1.163.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
b2sums=('9af48337d0faf40a3ceae8781df41e1fd7a801c08819b25f54f4881e9902610601769d8353d4937ee61f4786df5d8a1f179b686f5eceed0d05945ad0b4e9aa90')
sha512sums=('fda9288c0d367a9c710695a96be7a66cae49d0ee3faad8ae852908ee93fe9edfcbe2cb4e3d84f62f11b71d8904cb0e2ce1f057d102e4e2de45620219b97852ff')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}

