# Maintainer: Nenad Stojanovikj <aur-web@nenad.dev>
# Previous maintainer: David Stark <david@starkers.org>

pkgname=saml2aws
pkgver=2.16.0
_build=${pkgver}
pkgrel=1
pkgdesc="CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP"
url="https://github.com/Versent/saml2aws"
arch=("x86_64")
license=("MIT")
conflicts=()

source_x86_64=("https://github.com/Versent/saml2aws/releases/download/v${pkgver}/saml2aws_${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=("58f69c59b6fcd76bffed662eb2d80ac4")

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/saml2aws ${pkgdir}/usr/bin/saml2aws
}
