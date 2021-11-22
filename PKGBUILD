pkgname='mental-omega'
pkgver=3.3.6
pkgrel=1
pkgdesc="Mental Omega is a free unofficial expansion pack for Command & Conquer Red Alert 2 Yuri's Revenge."
arch=('x86_64' 'i686')
url="https://mentalomega.com/"
license=('custom')
depends=('wine' 'unionfs-fuse')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.lwqwq.com/ali/Linux-apps/${pkgname}.tar.gz"
        ${pkgname}.png
        ${pkgname}.desktop
        run)

        
package() {
  install -d "${pkgdir}/usr/share"
  cp -r "${pkgname}" "${pkgdir}/usr/share"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm755 run "${pkgdir}/usr/bin/${pkgname}"
} 
sha256sums=('bb2d70630b5fb42e4f1815935db8d70cb97d1a7d435cb59a06055fb36314a19d'
            '322ffee7754f18e80ac94947537965b31c48ceef2358d0c27ce9d0bba83de09f'
            '1ed82c3e0ec1bf9e264112145dd02cdc0b9ef74d7528acf3757442eac6155802'
            '2d97e3b068905f060ce3637dec22063cd55fdd1c2335545edd48fddc6bb84f0f')
