# Maintainer: Oleksandr Zinkevych <echo enNvMDQwMzk5QGdtYWlsLmNvbQo= | base64 -d>

pkgname=lets-bin
_pkgname=lets

pkgver=0.0.29
pkgrel=1
arch=("x86_64" "i686")
pkgdesc="CLI task runner for developers - a better alternative to make"
url="https://github.com/lets-cli/lets/"
license=("APACHE")
conflicts=('lets-bin' 'lets-git')
provides=('lets')
source_x86_64=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_x86_64.tar.gz")
source_i686=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_i386.tar.gz")
provides=('lets')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/local/bin/$_pkgname"
}

md5sums_x86_64=('4fce1314c11995753cc6b7fcc1bdf487')
md5sums_i686=('80639f109520cd3f904378c22aa35892')

