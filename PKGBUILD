# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-auth-quickconnect-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="The quickconnect extension provides a connection bar on the Guacamole Client home page that allows users to type in the URI of a server to which they want to connect and the client will parse the URI and immediately establish the connection."
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-quickconnect-${pkgver}.tar.gz")

md5sums=('bf04e2339a4b61fc0d7a9a75cba4d5ac')

package() {
  cd "${srcdir}/guacamole-auth-quickconnect-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-quickconnect-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
