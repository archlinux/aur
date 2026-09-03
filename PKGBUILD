# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('661c1b42d1fc9b36c4992c19696d0a9593edcca33a5251907cb9dc7f83201be999c474c060944681f0113a8140b7e82b0a7c09c3421588abccbf69f9deae3507')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
