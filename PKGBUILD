# Maintainer: Your Name <you@example.com>

pkgname=goatak-runit
pkgver=1
pkgrel=1
pkgdesc='runit service scripts for GoATAK'
arch=('any')
url='https://github.com/kdudkov/goatak'
license=('0BSD')
depends=('goatak' 'runit')
source=('goatak-run'
        'goatak-log-run')
sha256sums=('990a3e3b540d8c8a1a62579a5b3291ca11ec6faed5918d9f510bb8415ada899c'
            '09f0ad6ea6f971964c6406c175d224f5451b78000d4c66e71ad93595795cda88')

package() {
  install -Dm755 goatak-run     "$pkgdir/etc/runit/sv/goatak/run"
  install -Dm755 goatak-log-run "$pkgdir/etc/runit/sv/goatak/log/run"
}
