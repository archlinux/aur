# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.9.0
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

sha256sums=('ca27aae3e45f261135001911f5a349df4b3652268e67904159a679a89c9bbaa5')

package() {
  install -Dm 755 "$srcdir/tk-linux-amd64" "$pkgdir/usr/bin/tk"
}
