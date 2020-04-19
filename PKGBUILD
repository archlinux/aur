# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.9.1
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

sha256sums=('414c4f34ed55415b8fcc8a79c527e13da298e3c114f6e53e7b7d8507a3664649')

package() {
  install -Dm 755 "$srcdir/tk-linux-amd64" "$pkgdir/usr/bin/tk"
}
