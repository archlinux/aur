# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('744c938373f73a9f5dc202a8bf89364978dc2da97cb55f18446e7dc3c13e74a308a4b2e77798994d5b8b56936948705c80c93031ff70304b059d4358cb1d2b3b')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
