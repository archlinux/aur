pkgname=mikey-7x-abd57
pkgver=0.0.1
pkgrel=1
arch=('any')
depends=('python' 'wget' 'curl')
pkgdesc="CLI launcher for Project Synapse EEG decoder"
maintainer="Yogesh R. Chauhan"
license=('custom')
source=()
build() {
  echo "No build step"
}
package() {
  install -Dm755 "$HOME/abd57/usr/bin/mikey-7x-abd57" "$pkgdir/usr/bin/mikey-7x-abd57"
  install -Dm755 "$HOME/abd57/opt/abd57/mikey.sh" "$pkgdir/opt/abd57/mikey.sh"
}
