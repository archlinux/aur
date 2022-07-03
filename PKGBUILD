pkgname='dlauncher'
pkgver=0.1.2
pkgrel=2
conflicts=('dlauncher' 'dlauncher-bin')
provides=('dlauncher')
arch=('x86_64')
pkgdesc="An application launcher for Linux that is based on Ulauncher"
url="https://github.com/diced/dlauncher"
source=("$url/releases/download/v$pkgver/dlauncher" "$url/releases/download/v$pkgver/dlauncher-toggle")
sha256sums=('d526c1fbc76b641c73290cda07187c9f6a33d2edce0ee0be1181f751e524e612' '956e91036375df71a904863bcc1e731c4170a439f4ff386d4d18cd308e3ff3f0')
license=('GPL3')

package() {
  cd "$srcdir" || exit 1

  install -D -o root -g root -m 755 dlauncher "$pkgdir/usr/bin/dlauncher"
  install -D -o root -g root -m 755 dlauncher-toggle "$pkgdir/usr/bin/dlauncher-toggle"
}
