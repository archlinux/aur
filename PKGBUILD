# Maintainer: port19 <port19 at port19 dot xyz>
pkgname='nyaa-tui'
pkgver=1.1.1
pkgrel=1
pkgdesc='tui to download from nyaa.si'
arch=('x86_64')
url='https://github.com/woolw/nyaa-tui'
license=('GPL3')
depends=('openssl' 'aria2')
source=("https://github.com/woolw/${pkgname}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('59cf64b1f8e9f768b2cb1bbf172ca9dc337ce4d8657aadfcd354df43641e273a')

package() {
    install -Dm755 "nyaa-tui" "$pkgdir/usr/bin/nyaa-tui"
}
