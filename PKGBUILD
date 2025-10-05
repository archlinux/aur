# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism-bin
pkgver=1.2.0
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
b2sums_x86_64=('547535c9aa2d58f56184a64f58492c83292d6ee59b2cc727bd355b830aab30dd76cd0b5bc18e9dcfd310a5c813aae9bae529d468b182bc8880179a08fd134fce')
b2sums_aarch64=('605feaf66e9d2416081e341e01dc0b22d6e85fdf26d9b4a43574a53f923805bc1a4328c94aa3701eba781618e83d602054d7b0ac54c8059e29d7d754672e13a3')

package() {
  install -Dm755 prism "$pkgdir/usr/bin/go-prism"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
