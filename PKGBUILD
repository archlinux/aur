# Maintainer: Thomas Hobson <thomas@hexf.me>
pkgname=chart-testing
pkgver=3.0.0
pkgrel=1
epoch=0
source=('https://github.com/helm/chart-testing/releases/download/v3.0.0/chart-testing_3.0.0_linux_amd64.tar.gz')
sha256sums=('d0c324cb7edee0c894bb52df63cd8d5e7d85659d94e61004915c688a87d054ea')
pkgdesc="CLI tool for linting and testing Helm charts"
arch=('x86_64')
url="https://github.com/helm/chart-testing/"
license=('Apache')
depends=('helm' 'kubectl' 'yamllint' 'git' 'yamale')
provides=('ct')
backup=('etc/lintconfig.conf')
package() {
  cp -r etc/ $pkgdir/
  mkdir -p $pkgdir/usr/bin/
  cp ct $pkgdir/usr/bin/
}