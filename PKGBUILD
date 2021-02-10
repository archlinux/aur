# Maintainer: robertfoster

pkgname=h5ai
pkgver=0.30.0
pkgrel=1
arch=(any)
pkgdesc="A modern file indexer for HTTP web servers with focus on your files"
url="http://larsjung.de/h5ai/"
license=('MIT')
depends=('php')
optdepends=('apache: server software'
  'nginx: server software'
  'lighttpd: server sofware'
  'imagemagick: for PDF thumbs'
  'tar: for tar managing'
  'zip: for zip managing '
  'coreutils: for folders managing'
  'ffmpeg: for movie thumbs'
)
source=("http://release.larsjung.de/h5ai/${pkgname}-${pkgver}.zip")
options=('!strip')
webapps=usr/share/webapps

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/${webapps}"
  cp -r _"${pkgname}" "${pkgdir}/${webapps}/${pkgname}"
}

md5sums=('efcc3150648cfb5b22a2b2106e2c5b7f')
