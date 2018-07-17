# Maintainer: youngunix 
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=vertx
pkgver=3.5.3
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha256sums=("10562ad91a3ccaa9a975e8e52d1f782c0aed6ba402e53d24d50686b1cbdb535c")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vertx/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
