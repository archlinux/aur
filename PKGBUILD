# Maintainer: JuiceyDev <me@juicey.dev>
# Contributor: JuiceyDev <me@juicey.dev>

pkgname=juicebox2-plus-git-bin
pkgver=7fcd17b
pkgrel=1
pkgdesc='The companion app to juicebox² ! (binary release)'
arch=('x86_64')
url='https://github.com/juiceboxdev/juicebox-plus'
license=('LGPL-3.0-or-later')
depends=('gtk3' 'libappindicator-gtk3' 'libdbus' 'libxdo' 'glibc')
provides=('juicebox2-plus')
conflicts=('juicebox2-plus')
source=("https://github.com/juiceboxdev/juicebox-plus/releases/download/continuous/juicebox2-plus.tar.gz")
md5sums=('SKIP')

package() {
  tar xzf "juicebox2-plus.tar.gz"
  install -Dm755 "juicebox-plus-linux" "$pkgdir/usr/bin/juicebox-plus"
  install -Dm644 "juicebox-plus.desktop" "$pkgdir/usr/share/applications/juicebox-plus.desktop"
  install -Dm644 "logo.png" "$pkgdir/usr/share/pixmaps/juicebox-plus.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
