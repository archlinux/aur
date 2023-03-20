# Maintainer: atomicfs

pkgname=linux-beep-music
_gitname=beeps
pkgver=1.0.0
pkgrel=1
pkgdesc="Collection of beep melodies"
arch=('any')
url="https://github.com/ShaneMcC/beeps"
license=('')
depends=('beep')
makedepends=('git')
source=('git+https://github.com/ShaneMcC/beeps.git')
md5sums=('SKIP')

package() {
  cd "${_gitname}"
  install -m 755 -D aerodynamic.sh       "${pkgdir}/usr/bin/beep-song-aerodynamic.sh"
  install -m 755 -D alarm.sh             "${pkgdir}/usr/bin/beep-song-alarm.sh"
  install -m 755 -D beveryhillscop.sh    "${pkgdir}/usr/bin/beep-song-beveryhillscop.sh"
  install -m 755 -D carramelldansen.sh   "${pkgdir}/usr/bin/beep-song-carramelldansen.sh"
  install -m 755 -D ff-victory.sh        "${pkgdir}/usr/bin/beep-song-ff-victory.sh"
  install -m 755 -D furelise.sh          "${pkgdir}/usr/bin/beep-song-furelise.sh"
  install -m 755 -D gameofthrones.sh     "${pkgdir}/usr/bin/beep-song-gameofthrones.sh"
  install -m 755 -D hedwigs-theme.sh     "${pkgdir}/usr/bin/beep-song-hedwigs-theme.sh"
  install -m 755 -D imperialmarch.sh     "${pkgdir}/usr/bin/beep-song-imperialmarch.sh"
  install -m 755 -D la-cucaracha.sh      "${pkgdir}/usr/bin/beep-song-la-cucaracha.sh"
  install -m 755 -D mario.sh             "${pkgdir}/usr/bin/beep-song-mario.sh"
  install -m 755 -D mario-victory.sh     "${pkgdir}/usr/bin/beep-song-mario-victory.sh"
  install -m 755 -D merrychristmas.sh    "${pkgdir}/usr/bin/beep-song-merrychristmas.sh"
  install -m 755 -D missionimpossible.sh "${pkgdir}/usr/bin/beep-song-missionimpossible.sh"
  install -m 755 -D monkeyisland.sh      "${pkgdir}/usr/bin/beep-song-monkeyisland.sh"
  install -m 755 -D mortal-kombat.sh     "${pkgdir}/usr/bin/beep-song-mortal-kombat.sh"
  install -m 755 -D mythexe.sh           "${pkgdir}/usr/bin/beep-song-mythexe.sh"
  install -m 755 -D nyancat.sh           "${pkgdir}/usr/bin/beep-song-nyancat.sh"
  install -m 755 -D pacman.sh            "${pkgdir}/usr/bin/beep-song-pacman.sh"
  install -m 755 -D phaser.sh            "${pkgdir}/usr/bin/beep-song-phaser.sh"
  install -m 755 -D random.sh            "${pkgdir}/usr/bin/beep-song-random.sh"
  install -m 755 -D ring.sh              "${pkgdir}/usr/bin/beep-song-ring.sh"
  install -m 755 -D sandstorm.sh         "${pkgdir}/usr/bin/beep-song-sandstorm.sh"
  install -m 755 -D songoftime.sh        "${pkgdir}/usr/bin/beep-song-songoftime.sh"
  install -m 755 -D soviet_anthem.sh     "${pkgdir}/usr/bin/beep-song-soviet_anthem.sh"
  install -m 755 -D taps.sh              "${pkgdir}/usr/bin/beep-song-taps.sh"
  install -m 755 -D tetris.sh            "${pkgdir}/usr/bin/beep-song-tetris.sh"
  install -m 755 -D thunderstruck.sh     "${pkgdir}/usr/bin/beep-song-thunderstruck.sh"
}

