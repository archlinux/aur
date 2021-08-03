# Maintainer: Cat2048 <xdotoolhelper@outlook.com>
pkgname=xdotoolhelper-git
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple bash script to generate xdotool scripts."
arch=('any')
url="https://github.com/gamingdoom/xdotoolhelper"
license=('GPL3')
depends=('bash')
makedepends=('git')
source=('git+https://github.com/gamingdoom/xdotoolhelper.git')
noextract=()
sha256sums=('SKIP')

package() {
  ls
  cd "xdotoolhelper"
  cp -v xdotoolhelper.sh "xdotoolhelper-$pkgver"
  chmod 755 "xdotoolhelper-$pkgver"
  install -Dt "$pkgdir"/usr/bin "xdotoolhelper-$pkgver"
  echo "alias xdotoolhelper='xdotoolhelper-$pkgver'" >> ~/.bashrc
}
