# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>
pkgname=simplex-chat
pkgver=6.5.0
pkgrel=1
pkgdesc="The first messaging platform that has no user identifiers — terminal CLI client"
arch=('x86_64')
url="https://simplex.chat"
license=('AGPL-3.0-only')
depends=('gmp' 'openssl' 'pcre' 'glibc')
provides=('simplex-chat')
conflicts=('simplex-chat-bin')
source=("simplex-chat-${pkgver}::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-chat-ubuntu-22_04-x86_64")
sha256sums=('11ba7d48da56d9f8c32214498123913527c2ae938c51314ca69bdbfcaeedb933')

package() {
    install -Dm755 "${srcdir}/simplex-chat-${pkgver}" "${pkgdir}/usr/bin/simplex-chat"
}
