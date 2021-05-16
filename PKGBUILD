# Maintainer: Clansty <i@gao4.pw>
pkgname=fuck-totoro
pkgver=20200516
pkgrel=1
pkgdesc='Complete totoro-school running task automatically'
license=('MIT')
depends=('electron11')
arch=('any')
url="https://git.lwqwq.com/xtotoro/fuck-totoro-ui-react"
source=("app.asar::https://files.catbox.moe/998cpw.asar"
        icon.png
        ${pkgname}.desktop
        ${pkgname})

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app.asar" "${pkgdir}/usr/share/${pkgname}/app.asar"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
} 

md5sums=('60f191d7a2ca0e827bd5563435006105'
         '8dd054326fd3c9c0df4269fc9f15d7e3'
         'fe2eb0d2277b8856ef99b7cdcb8f2ce3'
         '231e02d181232d8bfd1cbcaa68dff880')
