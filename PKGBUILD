# Maintainer: youngunix 
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=vertx
pkgver=3.7.1
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha256sums=("9f1ffa16529371da9c14eee7f16b8019ef649ac9c2a053e0730e0ee89ccfb8e5")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vertx/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
