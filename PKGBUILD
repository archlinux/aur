# Maintainer: David Stark <david@starkers.org>

pkgname=saml2aws-bin
pkgver=2.10.0
_build=${pkgver}
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
url='https://github.com/Versent/saml2aws'
arch=('x86_64')
license=('MIT')
conflicts=()

source_x86_64=("saml2aws.tgz::https://github.com/Versent/saml2aws/releases/download/v${pkgver}/saml2aws_${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=('8bdbb63cfb082a98e6ebb59189f41c5d')

prepare() {
  tar xf saml2aws.tgz
}

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/saml2aws ${pkgdir}/usr/bin/saml2aws
}
