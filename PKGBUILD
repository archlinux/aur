# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Turn raw test output into beautiful data'
arch=('x86_64' 'aarch64')
url='https://github.com/DaltonSW/prism'
license=('MIT')
install=.install
provides=('go-prism')
conflicts=('go-prism' 'go-prism-git')
source_x86_64=("prism-$pkgver-x86_64.tar.gz::https://github.com/DaltonSW/prism/releases/download/v$pkgver/prism_Linux_x86_64.tar.gz")
source_aarch64=("prism-$pkgver-aarch64.tar.gz::https://github.com/DaltonSW/prism/releases/download/v$pkgver/prism_Linux_arm64.tar.gz")
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/DaltonSW/prism/refs/tags/v$pkgver/LICENSE")
b2sums=('616f5a61006544c92a9a85dd40281b853b2f10075f96aef42a16a6921b5e3fba7239d1b11fc5d8ab9b4719fa7bd769f8515951b7864d6e1ef6219c4ab18c8aae')
b2sums_x86_64=('e91a88402d3a2b5315e6719e3ad300da0d6954c36b3d9cd00d56f5f2f5e1c9eff5822186f02f5f4c1a35c2d9d3bc8c07ee0e903726bc2358c16c80694fa174e3')
b2sums_aarch64=('de7b2bdab1111e6c4184093ca5bfadb060f8b07e4d0c209ec817b7287c9966a75c100e4d132d95745550474271c95d5d59d482a3001ee5ed944a24e03b4de460')

package() {
  install -Dm755 prism "$pkgdir/usr/bin/go-prism"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
