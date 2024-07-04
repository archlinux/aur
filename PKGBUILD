pkgname=wcurl
pkgver=2024_07_02
pkgrel=1
pkgdesc='Whenever you need to download files through the terminal and dont feel like using wget'
arch=(any)
url='https://samueloph.dev/blog/announcing-wcurl-a-curl-wrapper-to-download-files/'
license=(curl)
depends=(curl)
source=("https://github.com/Debian/wcurl/raw/main/wcurl")
sha256sums=('2ae7e569deed5b84bca862c6276cb8d77680c64ecf9388115957ec99d70eb9af')

package() {
    install -Dm755 wcurl "$pkgdir/usr/bin/wcurl"
}
