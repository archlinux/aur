# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-vlang-app-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="V-native scaffolding CLI for the V programming language (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Create-Vlang-App/create-vlang-app"
license=('MIT')
depends=('glibc')
provides=('create-vlang-app' 'create-awesome-vlang-app')
conflicts=('create-awesome-vlang-app' 'create-vlang-app')
source=("create-vlang-app-linux-x86_64::https://github.com/Create-Vlang-App/create-vlang-app/releases/download/create-vlang-app@0.1.0/create-vlang-app-linux-x86_64")
sha256sums=('63fe872f041c5b8c045b0c913c002fe188069ebc33c59edc66c27c47d24d550f')

package() {
  install -Dm755 "${srcdir}/create-vlang-app-linux-x86_64" "$pkgdir/usr/bin/create-vlang-app"
  ln -s create-vlang-app "$pkgdir/usr/bin/create-awesome-vlang-app"
}
