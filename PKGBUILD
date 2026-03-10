pkgname=loongson-browser-bin
pkgver=3.4.2082.1
pkgrel=1
pkgdesc="Loongson Chromium-based browser"
arch=('x86_64')
url="https://www.loongson.cn"
license=('custom')

depends=(gtk3 gtk2 nss nspr libx11 libxcomposite libxdamage libxrandr libxext libxfixes alsa-lib dbus)


source=("lbrowser.deb::https://ftp.loongnix.cn/browser/lbrowser/3.4.2082.1/amd64/lbrowser_3.4.2082.1-1.stable.amd64.deb")

sha256sums=('851090a0d7ca4fab14521969d12a774307e5e9243c88e341e21fe30bad9dc4eb')

package() {
  bsdtar -xf "$srcdir/lbrowser.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}

