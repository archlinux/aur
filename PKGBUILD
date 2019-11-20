# Maintainer: Ivan Semkin <ivan AT semkin DOT ru>

pkgname=chromium-extension-runet-censorship-bypass
pkgver=0.0.1.38
pkgrel=1
pkgdesc='Chromium extension for bypassing censorship in Russia'
arch=(any)
url='https://github.com/anticensority/runet-censorship-bypass'
license=(GPL3)
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("https://github.com/anticensority/runet-censorship-bypass/releases/download/0.0.1.37/runet-censorship-bypass-${pkgver}-full.zip")
sha256sums=('52700dae72d64946c533e84b03d1f17bd61bebd2e67206d905e68905c0c9cdac')

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership "${srcdir}/extension-full"/* "${pkgdir}/usr/share/${pkgname}/"
}
