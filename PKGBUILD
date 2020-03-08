# Maintainer: Oleksandr Zinkevych <echo enNvMDQwMzk5QGdtYWlsLmNvbQo= | base64 -d>

pkgname=lets-bin
_pkgname=lets

pkgver=0.0.17
pkgrel=1
arch=("x86_64" "i686")
pkgdesc="CLI task runner - a better alternative to make"
url="https://github.com/lets-cli/lets/"
license=("APACHE")
conflicts=('lets-bin' 'lets-git')
provides=('lets')
source_x86_64=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_x86_64.tar.gz")
source_i686=("https://github.com/lets-cli/$_pkgname/releases/download/v$pkgver/lets_Linux_i386.tar.gz")
provides=('lets')

md5sums_x86_64=('0f4e56ce9faa19244d2a6d022e1185cd')
md5sums_i686=('0d4501e701028e314bdb0b55d6d63bfc')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/local/bin/$_pkgname"
}

