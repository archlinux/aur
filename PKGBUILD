# Maintainer: yifwon <wyf9661@gmail.com>

pkgname=fetch-github-hosts
pkgver=1.0.0
pkgrel=2
pkgdesc='Synchronize GitHub hosts tools.'
arch=(any)
url='https://gitee.com/if-the-wind/github-hosts'
license=(MIT)
provides=("${pkgname}")
source=("${pkgname}.service"
        "${pkgname}.timer")

sha1sums=('165dc7e0dcbabae00b02e13a5e550b2b2e54048c'
          '46734c76aa18f8fb98ccb602dce50d9419b28dec')

package() {
  install -Dm644 ${srcdir}/${pkgname}.service  ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 ${srcdir}/${pkgname}.timer    ${pkgdir}/usr/lib/systemd/system/${pkgname}.timer
}
