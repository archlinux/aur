# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=mc-dracula-theme
pkgver=1.0
pkgrel=1
pkgdesc="A dark theme for midnight commander (mc)"
arch=('any')
url="https://draculatheme.com/midnight-commander"
license=('MIT')
depends=('mc')
source=(
  "https://github.com/dracula/midnight-commander/raw/master/skins/dracula256.ini"
  "https://github.com/dracula/midnight-commander/raw/master/LICENSE"
)
sha256sums=('45e3477cfdead992f237b63de01a3881cf266ba30127d593f7bee2dcd909d79d'
            '4cdad101db975232dfef7ae7aa4058f676da365cabb45a19579f5e99aead9f30')

package() {
  install -Dm644 "${srcdir}/dracula256.ini" "${pkgdir}/usr/share/mc/skins/dracula256.ini"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
