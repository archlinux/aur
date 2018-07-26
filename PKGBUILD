# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=onyx-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Decentralized messaging application based on PSS (bin)'
arch=(x86_64)
url=https://mainframe.com
license=(MIT)
provides=(onyx)
conflicts=(onyx onyx-git)
options=(!strip)
source=(https://github.com/MainframeHQ/onyx/releases/download/v$pkgver/Onyx-$pkgver-linux-amd64.AppImage
        LICENSE)
sha512sums=(3e0630c2a734a438850e72a4fc7124c6bbd681f7e8db9912aa060b49a1e8b1ba3701622607a5be74d5498fdcb62284378e80f4f2f57cab85422c931bcb6644a4
            071eb3c19e5311b119429ce20a18731b48163674628abde78496f4de6756dc7404598e281cede321f75b22aae0224c3f26fb7a6d24198ea87e04ba6815985255)

package() {
  install -D Onyx-$pkgver-linux-amd64.AppImage "$pkgdir"/usr/bin/onyx
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/onyx/LICENSE
}
