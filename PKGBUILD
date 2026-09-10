# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-vlang-app-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="V-native scaffolding CLI for the V programming language (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Create-Vlang-App/create-vlang-app"
license=('MIT')
depends=('glibc')
provides=('create-vlang-app' 'create-awesome-vlang-app')
conflicts=('create-awesome-vlang-app' 'create-vlang-app')
source=("create-vlang-app-linux-x86_64::https://github.com/Create-Vlang-App/create-vlang-app/releases/download/create-vlang-app@0.2.0/create-vlang-app-linux-x86_64")
sha256sums=('980ef50a6921cfd3427104ba0e893c3dd0393709b639bcae6265e3794d850980')

package() {
  install -Dm755 "${srcdir}/create-vlang-app-linux-x86_64" "$pkgdir/usr/bin/create-vlang-app"
  ln -s create-vlang-app "$pkgdir/usr/bin/create-awesome-vlang-app"
}
