# Maintainer: youngunix 
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=vertx
pkgver=3.5.4
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha256sums=("9a23895f45c5951c53368d3b5b511d760183617aff76e1693d359a5e928220a2")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vertx/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
