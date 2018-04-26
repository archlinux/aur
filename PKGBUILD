# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=onyx-bin
pkgver=0.4.2
pkgrel=2
pkgdesc='Decentralized messaging application based on PSS (bin)'
arch=(x86_64)
url='https://mainframe.com'
license=(MIT)
conflicts=(onyx)
options=(!strip)
source=(https://github.com/MainframeHQ/onyx/releases/download/v$pkgver/Mainframe-$pkgver-linux-amd64.AppImage
        LICENSE)
sha512sums=(accd43344eec6b267c2ba16de3b323ee80da1b84478ea6473a7d14dfc34d88e30366aa2ac592a1f26489801103ddfb7bfe52bcf46db298a93e1e8059fed7238a
            071eb3c19e5311b119429ce20a18731b48163674628abde78496f4de6756dc7404598e281cede321f75b22aae0224c3f26fb7a6d24198ea87e04ba6815985255)

package() {
  cd $srcdir
  install -Dm 755 Mainframe-$pkgver-linux-amd64.AppImage $pkgdir/usr/bin/onyx
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/onyx/LICENSE
}
