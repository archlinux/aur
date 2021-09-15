# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>

pkgname=lets-burn
pkgver=0.0.1
pkgrel=1
pkgdesc='Play the starcraft1 hellbat sound byte "lets burn" at 4:20 every day'
arch=('any')
#url='https://github.com/Thann/play-with-mpv'
license=('Unlicense')
depends=('mpv' 'libvorbis' 'systemd')
source=("lets-burn.ogg" "lets-burn.timer" "lets-burn.service")
sha256sums=(
 '6caf811f2f534c46f82b9af1646c69aaf931f2283b51f42dbd6550d65831f1ba'
 'b61307bde9d305b5e67348e126b2a9e1a4e9390e24ffc69250f9f656cb5376c3'
 '16def317d2ddebcd85cba0807424725831d3a585d42d4dafeb07f85565782194')


package() {
  install -D -m644 ./lets-burn.ogg "$pkgdir/usr/share/misc/lets-burn.ogg"
  install -D -m644 ./lets-burn.timer "$pkgdir/usr/lib/systemd/user/lets-burn.timer"
  install -D -m644 ./lets-burn.service "$pkgdir/usr/lib/systemd/user/lets-burn.service"
}
