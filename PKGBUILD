# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=linux-beep-music
_gitname=beeps
pkgver=1.0.2
pkgrel=1
pkgdesc="Collection of beep melodies"
arch=('any')
url="https://github.com/ShaneMcC/beeps"
depends=('beep')
makedepends=('git')
source=('git+https://github.com/ShaneMcC/beeps.git')
md5sums=('SKIP')

package() {
  cd "${_gitname}"
  install -m 755 -D aerodynamic.sh       "${pkgdir}/usr/bin/beep-song-aerodynamic"
  install -m 755 -D alarm.sh             "${pkgdir}/usr/bin/beep-song-alarm"
  install -m 755 -D beveryhillscop.sh    "${pkgdir}/usr/bin/beep-song-beveryhillscop"
  install -m 755 -D carramelldansen.sh   "${pkgdir}/usr/bin/beep-song-carramelldansen"
  install -m 755 -D ff-victory.sh        "${pkgdir}/usr/bin/beep-song-ff-victory"
  install -m 755 -D furelise.sh          "${pkgdir}/usr/bin/beep-song-furelise"
  install -m 755 -D gameofthrones.sh     "${pkgdir}/usr/bin/beep-song-gameofthrones"
  install -m 755 -D hedwigs-theme.sh     "${pkgdir}/usr/bin/beep-song-hedwigs-theme"
  install -m 755 -D imperialmarch.sh     "${pkgdir}/usr/bin/beep-song-imperialmarch"
  install -m 755 -D la-cucaracha.sh      "${pkgdir}/usr/bin/beep-song-la-cucaracha"
  install -m 755 -D mario-victory.sh     "${pkgdir}/usr/bin/beep-song-mario-victory"
  install -m 755 -D mario.sh             "${pkgdir}/usr/bin/beep-song-mario"
  install -m 755 -D merrychristmas.sh    "${pkgdir}/usr/bin/beep-song-merrychristmas"
  install -m 755 -D missionimpossible.sh "${pkgdir}/usr/bin/beep-song-missionimpossible"
  install -m 755 -D monkeyisland.sh      "${pkgdir}/usr/bin/beep-song-monkeyisland"
  install -m 755 -D mortal-kombat.sh     "${pkgdir}/usr/bin/beep-song-mortal-kombat"
  install -m 755 -D mythexe.sh           "${pkgdir}/usr/bin/beep-song-mythexe"
  install -m 755 -D nyancat.sh           "${pkgdir}/usr/bin/beep-song-nyancat"
  install -m 755 -D pacman.sh            "${pkgdir}/usr/bin/beep-song-pacman"
  install -m 755 -D phaser.sh            "${pkgdir}/usr/bin/beep-song-phaser"
  install -m 755 -D random.sh            "${pkgdir}/usr/bin/beep-song-random"
  install -m 755 -D ring.sh              "${pkgdir}/usr/bin/beep-song-ring"
  install -m 755 -D sandstorm.sh         "${pkgdir}/usr/bin/beep-song-sandstorm"
  install -m 755 -D songoftime.sh        "${pkgdir}/usr/bin/beep-song-songoftime"
  install -m 755 -D soviet_anthem.sh     "${pkgdir}/usr/bin/beep-song-soviet_anthem"
  install -m 755 -D taps.sh              "${pkgdir}/usr/bin/beep-song-taps"
  install -m 755 -D tetris.sh            "${pkgdir}/usr/bin/beep-song-tetris"
  install -m 755 -D thunderstruck.sh     "${pkgdir}/usr/bin/beep-song-thunderstruck"
}

