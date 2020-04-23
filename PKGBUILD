# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.9.2
pkgrel=0
pkgdesc="Flexible, reusable and concise configuration for Kubernetes using Jsonnet"
arch=('x86_64')

url="https://tanka.dev"
license=('Apache')
source=("https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")

depends=('diffutils' 'kubectl')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)

provides=(tanka)
conflicts=(tanka)

sha256sums=('3fc677c4d758ad787ec3ff40eacbe2ca6a808b533b48d80ed65c26d34ddae827')

package() {
  install -Dm 755 "$srcdir/tk-linux-amd64" "$pkgdir/usr/bin/tk"
}
