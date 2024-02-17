# Maintainer: Alexander Bauer <sasha@linux.com>
# shellcheck disable=SC2034
pkgname=tfupdate-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Update version constraints in your Terraform configurations '
url='https://github.com/minamijoyo/tfupdate'
source_x86_64=("https://github.com/minamijoyo/tfupdate/releases/download/v$pkgver/tfupdate_${pkgver}_linux_amd64.tar.gz")
arch=('x86_64')
license=('MIT')
depends=()
optdepends=()
conflicts=('tfupdate')
provides=('tfupdate')
sha256sums_x86_64=('5eccc4ed61303edb80eb26fa76edf3535114bc18b7a5eaafa581aee5e98c91ce')

package() {
  cd "$srcdir/"

  install -Dm755 tfupdate "${pkgdir}/usr/bin/tfupdate"
}
