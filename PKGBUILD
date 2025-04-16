# Maintainer: Alexander Bauer <sasha@linux.com>
# shellcheck disable=SC2034
pkgname=tfupdate-bin
pkgver=0.8.5
pkgrel=2
pkgdesc='Update version constraints in your Terraform configurations '
url='https://github.com/minamijoyo/tfupdate'
source_x86_64=("https://github.com/minamijoyo/tfupdate/releases/download/v$pkgver/tfupdate_${pkgver}_linux_amd64.tar.gz")
arch=('x86_64')
license=('MIT')
depends=()
optdepends=()
conflicts=('tfupdate')
provides=('tfupdate')
sha256sums_x86_64=('467bb4faadef3b51f6b6dbf4afe27632378124e7f32dcc6280eb47033ea029bd')

package() {
  cd "$srcdir/"

  install -Dm755 tfupdate "${pkgdir}/usr/bin/tfupdate"
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/tfupdate-bin/LICENSE"
}
