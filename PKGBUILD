# Maintainer: robertfoster

pkgname=h5ai
pkgver=0.30.0 # renovate: datasource=github-tags depName=lrsjng/h5ai
pkgrel=1
arch=(any)
pkgdesc="A modern file indexer for HTTP web servers with focus on your files"
url="https://github.com/lrsjng/h5ai"
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
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
options=('!strip')
webapps=usr/share/webapps

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/${webapps}"
  cp -r _"${pkgname}" "${pkgdir}/${webapps}/${pkgname}"
}

sha256sums=('fe138305a61d72094beb8c507dab728020158e4b00dae695a60b9803babb3e30')
