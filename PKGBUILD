# Maintainer: Oleksandr Zinkevych <echo enNvMDQwMzk5QGdtYWlsLmNvbQo= | base64 -d>

pkgname=lets-bin
_pkgname=lets

pkgver=0.0.15
pkgrel=1
arch=("x86_64" "i686")
pkgdesc="CLI task runner - a better alternative to make"
url="https://github.com/lets-cli/lets/"
license=("APACHE")
source_x86_64=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_x86_64.tar.gz")
source_i686=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_i386.tar.gz")
provides=('lets')

md5sums_x86_64=('96232539bd1feeb24867a01174711712')
md5sums_i686=('a7e99720d209cb2e2c0c83915635fcee')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/local/bin/$_pkgname"
}

