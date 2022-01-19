pkgname='mental-omega'
pkgver=3.3.6
pkgrel=4
pkgdesc="Mental Omega is a free unofficial expansion pack for Command & Conquer Red Alert 2 Yuri's Revenge."
arch=('x86_64' 'i686')
url="https://mentalomega.com/"
license=('custom')
depends=('wine')
options=('!strip')
source=("${pkgname}-${pkgver}-${pkgrel}.tar::https://alist.api13.lwqwq.com/d/%E9%98%BF%E9%87%8C%E4%BA%91%E7%9B%98/res/mental-omega.tar"
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
sha256sums=('07b89d381cc345ba1cb619c71912264ed5d0d9651ef96fbde31b37d3c53535aa'
            '322ffee7754f18e80ac94947537965b31c48ceef2358d0c27ce9d0bba83de09f'
            '1ed82c3e0ec1bf9e264112145dd02cdc0b9ef74d7528acf3757442eac6155802'
            '071c0e9510ee6c7d7e62cc2151ee770fe544cf93af4abe322dfcea58bba4728d')
