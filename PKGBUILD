# Maintainer: DonKeyPWN
pkgname=devkit-env
pkgver=1.0.1
pkgrel=1
pkgdesc='environment settings for devkitPro supplied tools'
arch=('x86_64')
url='https://github.com/devkitPro'
license=('GPL')
groups=(
    'gp32-dev'
    'gba-dev'
    'nds-dev'
    '3ds-dev'
    'gamecube-dev'
    'wii-dev'
    'wiiu-dev'
    'switch-dev'
)

source=(
    devkit-env.sh
)
sha256sums=('812c9d59d86dd34ddb64ec1190f53832e7cac04388d2a413e931e2a774660908')

package() {
    install -d "${pkgdir}"/etc/profile.d
    cp devkit-env.sh "${pkgdir}"/etc/profile.d/
}
