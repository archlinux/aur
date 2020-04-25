# Maintainer: Shell Chen <aur@sorz.org>
pkgname=python-ssmanager
pkgver=0.2.8
pkgrel=1
pkgdesc="A python module managing large amount of running Shadowsocks server instances."
url="https://github.com/sorz/ssmanager/"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-pip')
source=("https://github.com/sorz/ssmanager/releases/download/v$pkgver/ssmanager-$pkgver-py3-none-any.whl")
md5sums=('2093c4c012fc7420a659f5f99dd89a7a')

package() {
    cd "$srcdir"
    PIP_CONFIG_FILE=/dev/null pip install \
        --isolated --root="$pkgdir" --ignore-installed --no-deps \
        ssmanager-$pkgver-py3-none-any.whl
}
