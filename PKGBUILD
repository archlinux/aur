# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism-bin
pkgver=1.1.0
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
b2sums_x86_64=('d656ea374a70076c58ca1b7ab67635191b1879acd213741ddc354df9ff7fe3450ce8e5aa5dcba4f4e00ca6e359fb2c2e4ba9b412a8da83f6906f70969614d131')
b2sums_aarch64=('8b98fc61dbb47a3ff48f3f3cd0398a868cdf3ac239e0254f66e516b630f26c53c1eab3e85109de675f77a3e80c607dff44373ef0d83643b672847a779460c9b4')

package() {
  install -Dm755 prism "$pkgdir/usr/bin/go-prism"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
