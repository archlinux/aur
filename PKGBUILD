# Maintainer: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=html-embed-git
pkgver=1.0
pkgrel=0
pkgdesc='Embed HTML resources using base64'
arch=('i686' 'x86_64')
url='https://github.com/v--/html-embed'
license=('BSL 1.0')
depends=('curl')
makedepends=('git' 'dub' 'dmd')
provides=('html-embed')
conflicts=('html-embed')
md5sums=('SKIP')
source='git://github.com/v--/html-embed.git'

package() {
    cd "$srcdir/html-embed"
    dub build -b release
    mkdir -p "$pkgdir/usr/bin"
    cp "html-embed" "$pkgdir/usr/bin/html-embed"
}
