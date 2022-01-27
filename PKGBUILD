pkgname=theme.sh
provides=("${pkgname}")
pkgver=1.1.5
pkgrel=3
arch=('any')
makedepends=('git')
optdepends=('fzf')
url="https://github.com/lemnos/theme.sh"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('00baa7e23c3a3922ddb90ac3ae4c31fc8353cc5a5f0ec8779f10a17490f46400')

package() {
  cd "$pkgname-$pkgver"
  chmod +x "bin/theme.sh"
  install -Dm755 "bin/theme.sh" "$pkgdir/usr/bin/theme.sh"
}
