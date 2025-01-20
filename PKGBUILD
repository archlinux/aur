# Maintainer: yifwon <wyf9661@gmail.com>

pkgname=fetch-github-hosts
pkgver=1.0.0
pkgrel=1
pkgdesc='Synchronize GitHub hosts tools.'
arch=(any)
url='https://github.com/Clov614/SteamHostSync'
license=(MIT)
provides=("${pkgname}")
source=("${pkgname}.service"
        "${pkgname}.timer")

sha1sums=('e3e427f8dbb4a1140a41f1cae588daabe347772c'
          '46734c76aa18f8fb98ccb602dce50d9419b28dec')

package() {
  install -Dm644 ${srcdir}/${pkgname}.service  ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 ${srcdir}/${pkgname}.timer    ${pkgdir}/usr/lib/systemd/system/${pkgname}.timer
}
