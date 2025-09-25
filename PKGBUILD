# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc-bin
pkgver=6.0.0
pkgrel=2
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'arm64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
provides=('ggc')
conflicts=('ggc' 'ggc-git')
source_x86_64=("ggc-$pkgver-x86_64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_amd64.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
source_arm64=("ggc-$pkgver-arm64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_arm64.tar.gz"
              "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
b2sums_x86_64=('4d916d3b9e019462dda4bb22a7fd5f527404d2f65121456114549dbb9eddd47d4bb2eccedaeb9d05a0e0d5e56a6c147ee2b869e1a23f36554a184d7942e60dab'
               '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')
b2sums_arm64=('ea13047672d933d7128b36d89e8bf9e360324ac6c6fca3cd5ddfd888fd6ea0e1402dfb2e23c41aae60e7da607639978f37c2e2bc1c1d93b0b897ccec3733f5c7'
              '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')

package() {
  install -Dm755 ggc "$pkgdir/usr/bin/ggc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
