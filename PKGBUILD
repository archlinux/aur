# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=zsh-prompt-ys
pkgver=1.0.0
pkgrel=1
pkgdesc="ysmood's prompt for zsh"
arch=('any')
url="https://github.com/grawlinson/zsh-prompt-ys"
license=('MIT')
depends=('zsh')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/grawlinson/${pkgname}/tar.gz/${pkgver}"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/grawlinson/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.gz.asc")
sha512sums=('ec0a6d1816b31e9f7f81d26c24e91373bdddeb39ccf283bb6263c59c46cfd4ec4e5a4d64db875f9de8495fe23a10c08295ece748a9ee8f67aae209f19fe73f72'
            'SKIP')
validpgpkeys=('034D823DA2055BEE6A6BF0BB25EA6900D9EA5EBC') # George Rawlinson <george@rawlinson.net.nz>

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 prompt_ys_setup "${pkgdir}/usr/share/zsh/functions/Prompts/prompt_ys_setup"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: expandtab tabstop=2 shiftwidth=2
