# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname=vertx
pkgver=3.0.0
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha1sums=("47b0fad8de3e9c175fca9ff70a127facdd0c0cf0")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vert.x-${pkgver}/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
