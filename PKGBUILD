# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=5.14.2
pkgrel=1
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
#makedepends=('')
source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz"
        "${pkgname}-${pkgver}_amd64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz"
      )
sha256sums=(
            'e6e08a4c135e696369c5e855e83cdbc21d3f653b54abdef9a1e75e526f34ad94'
            'ebb1e3595b91c0a5a46b456453130f2b1a9c5db31d776f70660513936e54bdde'
          )


# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}

