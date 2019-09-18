# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=rbenv-vars
pkgver=1.2.0
pkgrel=2
pkgdesc='An rbenv plugin that safely sets global and per-project environment variables.'
arch=('any')
url='https://github.com/rbenv/rbenv-vars'
license=('MIT')
source=("https://github.com/rbenv/rbenv-vars/archive/v$pkgver.tar.gz")
sha256sums=('9e6a5726aad13d739456d887a43c220ba9198e672b32536d41e884c0a54b4ddb')

package() {
  cd "$srcdir/rbenv-vars-1.2.0"

  install -Dm 755 bin/rbenv-vars "$pkgdir/usr/lib/rbenv/libexec/rbenv-vars"
  install -Dm 644 etc/rbenv.d/exec/rbenv-vars.bash "$pkgdir/usr/lib/rbenv/hooks/exec/rbenv-vars.bash"
}
