# Maintainer: Thomas Hobson <thomas@hexf.me>
pkgname=chart-testing
pkgver=2.4.1
pkgrel=1
epoch=0
source=('https://github.com/helm/chart-testing/releases/download/v2.4.1/chart-testing_2.4.1_linux_amd64.tar.gz')
sha256sums=('70d5a0141a8331f85355155368cb555f5143625effdbb4a20e662dd5d965de14')
pkgdesc=CLI tool for linting and testing Helm charts
arch=('x86_64')
url=https://github.com/helm/chart-testing/
license=('Apache')
depends=('helm' 'kubectl' 'yamllint' 'git' 'yamale')
provides=('ct')
backup=('etc/lintconfig.conf')
package() {
  cp -r etc/ $pkgdir/
  mkdir -p $pkgdir/usr/bin/
  cp ct $pkgdir/usr/bin/
}