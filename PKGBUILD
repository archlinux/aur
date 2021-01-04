# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

pkgname=delaford
pkgver=1
pkgrel=1
pkgdesc="An online JavaScript 2D Medieval RPG. "
arch=('x86_64')
url="https://github.com/delaford/game"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
provides=('delaford')
source=('git+https://github.com/delaford/game.git')
md5sums=('SKIP')

package() {
  cd game
  npm install
  npm run serve
  echo -e "\033[0;31mThe server will be started now, if you wanto to enable it run:\033[0m"
  echo -e "cd path/to/game && npm run serve"
}
