# Maintainer: Oleksandr Zinkevych <echo enNvMDQwMzk5QGdtYWlsLmNvbQo= | base64 -d>

pkgname=lets-bin
_pkgname=lets

pkgver=0.0.23
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

md5sums_x86_64=('de601d9ae760ee2723a862ca01ed56eb')
md5sums_i686=('e540eb399a01868b33854d755c5c2527')
