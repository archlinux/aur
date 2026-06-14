# Maintainer: Jotalea <main@jotalea.com.ar>
pkgname=xslang-bin
pkgver=1.2.32
pkgrel=1
pkgdesc="The XS programming language"
arch=('x86_64')
url="https://xslang.org/"
license=('Apache')
depends=('glibc')
provides=('xs')
conflicts=('xs')
options=('!strip' '!debug') 
source=("xs::https://github.com/xs-lang0/xs/releases/download/v${pkgver}/xs-linux-x86_64")
sha256sums=('260e9afe92c9f4e36e1cb0cb80a2e5ead8d8101a3e974b48036ede5df6d7c9f5') 

package() {
    install -Dm755 "${srcdir}/xs" "${pkgdir}/usr/bin/xs"
}
