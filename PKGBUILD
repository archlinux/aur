# Maintainer: Oliver Ford <dev@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=iosevka-generate
pkgver=0.1.0
pkgrel=1
pkgdesc='A tool to generate custom Iosevka fonts from a configuration file'
url='https://github.com/OJFord/iosevka-generate'
license=('GPL')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('11b237c10a50c7a28e09f71499a3ab0f')
arch=('any')
depends=(
    'make'
    'npm'
    'otfcc'
    'python-gitpython'
    'python-xdg'
    'ttfautohint'
)

package() {
    set -e
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
}
