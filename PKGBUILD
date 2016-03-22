# Maintainer: youngunix <zagazaw2004 {} gmail () {}>
# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=vertx
pkgver=3.2.1
pkgrel=1
pkgdesc="Effortless asynchronous application development for the modern web and enterprise"
arch=(any)
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")

source=("https://bintray.com/artifact/download/vertx/downloads/vert.x-${pkgver}-full.tar.gz")
sha1sums=("dd36a6e40b694f5343c11ae4aa9b71f8d9aa66fd")

package() {
    install -d -m 755 ${pkgdir}/opt
    mv ${srcdir}/vert.x-${pkgver}/ ${pkgdir}/opt/vertx

    install -d -m 755 ${pkgdir}/usr/bin
    ln -s /opt/vertx/bin/vertx ${pkgdir}/usr/bin
}
