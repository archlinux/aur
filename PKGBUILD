pkgname=nginx-config-formatter-git
pkgver=6df60552ddb39c4b1ea7118e067961733a261f49
pkgrel=1
pkgdesc="nginx config file formatter/beautifier written in Python. "
depends=('python')
license=('Apache 2.0')
arch=('any')
url="https://github.com/1connect/nginx-config-formatter"
source=($pkgname::git+$url)
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 nginxfmt.py "$pkgdir/usr/bin/nginxfmt.py"
}
