# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=discogs-xml2db-bin
pkgver=2.1
pkgrel=1
pkgdesc="Imports the discogs.com monthly XML dumps into databases"
arch=('x86_64')
url="https://github.com/philipmat/discogs-xml2db"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/discogsxml2db-linux-x64.zip")
sha256sums_x86_64=('9ae576454f9426d1d83b60b0a8357f69e3cf15e56329dc09df56f1d9c917c09f')

package() {
  install -Dm755 "discogs" "${pkgdir}/usr/bin/discogs"
}
