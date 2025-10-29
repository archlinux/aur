# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc-bin
pkgver=7.0.4
pkgrel=1
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'aarch64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
provides=('ggc')
conflicts=('ggc' 'ggc-git')
source_x86_64=("ggc-$pkgver-x86_64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_amd64.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
source_aarch64=("ggc-$pkgver-arm64.tar.gz::https://github.com/bmf-san/ggc/releases/download/v$pkgver/ggc_${pkgver}_linux_arm64.tar.gz"
              "LICENSE::https://raw.githubusercontent.com/bmf-san/ggc/refs/tags/v$pkgver/LICENSE")
b2sums_x86_64=('2367f50f8ba3c5c3aef226658aa75301f3856d7cbd31d9169a86073b1d06a40bafab64105d280753709b2f16ab457a21ad9e9410db716f4ed1439507b54dc979'
               '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')
b2sums_aarch64=('694317ba445d848755c5d0479f77299e3f096370a5a4fb36a5cc6a600cb4518222ede08652fb65a09e9d59c9d72901cd3a5c867cb5da191d1f2d89c41d34cd76'
                '549edae63d8fa8f73000d9edac22b3db17e880e1867a617ac995ad6af54d2331080df7dfef962e9f316b3744d42986edb52e15fbe2c07ad2e9bf8b7b8a300be1')

package() {
  install -Dm755 ggc "$pkgdir/usr/bin/ggc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
