# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.13.0
pkgrel=0
pkgdesc='Flexible, reusable and concise configuration for Kubernetes using Jsonnet'
arch=('x86_64')

url='https://tanka.dev'
license=('Apache')
source=("tk-$pkgver::https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")

depends=('diffutils' 'kubectl')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)

provides=(tanka)
conflicts=(tanka)

package() {
  install -Dm 755 "$srcdir/tk-$pkgver" "$pkgdir/usr/bin/tk"
}

sha256sums=('23447b674eb6f7ea1040486c9250106ff04a739c8fe60a8066f5f3bc3c2f374f')
