# Maintainer: youngunix 
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=vertx
pkgver=3.4.0
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha1sums=("f5b0f0517b98d531c6e3162d762b1a8707dbbf95")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vertx/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
