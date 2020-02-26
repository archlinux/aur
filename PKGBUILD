# Maintainer: Oleksandr Zinkevych <echo enNvMDQwMzk5QGdtYWlsLmNvbQo= | base64 -d>

pkgname=lets-bin
_pkgname=lets

pkgver=0.0.14
pkgrel=1
arch=("x86_64" "i686")
pkgdesc="CLI task runner - a better alternative to make"
url="https://github.com/lets-cli/lets/"
license=("APACHE")
source_x86_64=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_x86_64.tar.gz")
source_i686=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_i386.tar.gz")
provides=('lets')

md5sums_x86_64=('cf2ff14a4874d9d9d716de841c5be5a0')
md5sums_i686=('b2e84ebc94b1da2dfdf4801442e39508')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/local/bin/$_pkgname"
}

