# Maintainer: youngunix 
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=vertx
pkgver=3.5.2
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha256sums=("c9815434c9fc9474ec8eef4ef171c96f454fb08c2728ec855592ecbabb348e0b")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vertx/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
