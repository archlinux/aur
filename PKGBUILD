# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Evan Buss <evan.buss28@gmail.com>

pkgname=openbooks-bin
binaryname=openbooks
pkgver=4.5.0
pkgrel=1
pkgdesc="Openbooks allows you to download ebooks from irc.irchighway.net quickly and easily."
provides=('openbooks')
arch=('aarch64' 'x86_64')
url="https://github.com/evan-buss/openbooks"
source=("https://raw.githubusercontent.com/evan-buss/openbooks/master/README.md")
source_aarch64=("$binaryname::https://github.com/evan-buss/openbooks/releases/download/v$pkgver/openbooks_linux_arm")
source_x86_64=("$binaryname::https://github.com/evan-buss/openbooks/releases/download/v$pkgver/openbooks_linux")

sha256sums=('325d0ea858b3506ade1c2303c86307136dc6c5b14f5a16b15b42cd27cf513fa9')
sha256sums_aarch64=('dc7c168f9c24141f991c337fc332e14d91268e7f7fdf49e04687833ff0d3b16d')
sha256sums_x86_64=('efa4e2dec2fd40374bb222a233b0ba612c64495d760500a6881ed8a040065d4d')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./openbooks
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
