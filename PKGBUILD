# Maintainer: Jake VanderKolk <jakevanderkolk@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=pixelserv
pkgver=1.0
pkgrel=4
pkgdesc="Pixelserv is a super minimal webserver, it's one and only purpose is serving a 1x1 pixel transparent gif file."
arch=(any)
url="http://proxytunnel.sourceforge.net/pixelserv.php"
license=('BSD')
depends=(perl)
source=(http://proxytunnel.sourceforge.net/files/pixelserv.pl.txt pixelserv.service)
sha256sums=('8f6903712360f2a74fd24174bbb804e1f61e861f3af91950c4082c1adff73528'
            '1e889e2dede4f2620a800c6c5ba19c79642ce3d23206d7d722739f4c113e9808')

package() {
  install -Dm644 "$srcdir/pixelserv.service" "$pkgdir/usr/lib/systemd/system/pixelserv.service"
  install -Dm755 "$srcdir/pixelserv.pl.txt" "$pkgdir/usr/bin/pixelserv.pl"
}
