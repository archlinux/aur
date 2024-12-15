# Maintainer: FranoGames
pkgname=altf5
pkgver=1.0
pkgrel=1
pkgdesc="Force quit the active window (KDE6)"
arch=(x86_64)
license=('Apache')
install="altf5.install"
depends=(
  'kwin'
  'bash'
)
source=("kwin_script.js"
        "altf5.sh"
        "altf5.desktop"
      )
sha256sums=(
  'cf27d8c34d27c8331bfa08a17aa7bf54a870b3cc114316a8f16569763ace0368'
  'a6330f22c125385043e343e6247caf7b766095ecab9224cb985e731cba2b8cad'
  'c021becdf9b83b631ca562002c0f1127b2b331189ef4b60e090ee1b7dd231e97'
)

package() {
  install -dm755 "${pkgdir}"/usr/share/{altf5,applications}
  install -m755 altf5.sh "${pkgdir}"/usr/share/altf5
  install -m644 kwin_script.js "${pkgdir}"/usr/share/altf5
  install -m644 altf5.desktop "${pkgdir}"/usr/share/applications
}

