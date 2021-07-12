# Maintainer: Tim Boeckstaens <boeckstaenstim+aur@gmail.com>
pkgname=keytool-bash-autocomplete
pkgver=1.0.0
pkgrel=1
pkgdesc='Bash autocompletion for java keytool'
arch=('any')
url='https://github.com/codingtim/keytool-bash-autocomplete'
license=('GPL3')
depends=('bash' 'bash-completion')
provides=()
backup=()
options=()
source=("https://github.com/codingtim/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("993f2c5c31b034908fb699250b0df9af58d91f4c9814529af48e629f1d2aa751")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/bash-completion/completions/ 
  cp keytool-completion $pkgdir/usr/share/bash-completion/completions/keytool
}

