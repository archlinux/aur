# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.5.22
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('747a979efae7028244b4d320b7daf4f91324b1ad765d43818ddf5118f44fa556596b7040ee2a0dfb86a20c539f6fa13407a0e6d73e465dc845a8f1639f46d211')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
