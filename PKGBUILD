pkgname=bebz-essentials
pkgver=0.2.0
pkgrel=1
pkgdesc="La Bebzerie : Setup complet Gaming & Système (Nvidia, Steam, Lutris, Wine)"
arch=('any')
url="https://github.com/FlyXOwl/aur-bebz-essentials"
license=('MIT')

# Dépendances
depends=(
    'nvidia-dkms'
    'nvidia-utils'
    'lib32-nvidia-utils'
    'steam'
    'discord'
    'networkmanager'
    'nm-connection-editor'
    'bluez'
    'bluez-utils'
    'git'
    'base-devel'
    'lutris'
    'heroic-games-launcher-bin'
    'wine-staging'
    'winetricks'
    'gamemode'
    'lib32-gamemode'
    'mangohud'
    'lib32-mangohud'
    'giflib' 'lib32-giflib'
    'libpng' 'lib32-libpng'
    'libldap' 'lib32-libldap'
    'vulkan-icd-loader'
    'lib32-vulkan-icd-loader'
)

optdepends=(
    'proton-ge-custom-bin: Version de Proton optimisée par GE'
    'gamescope: Micro-compositeur pour optimiser le focus des jeux'
    'goverlay: Interface graphique pour configurer MangoHud'
)

package() {
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    echo "Copyright (c) 2026 FlyXOwl - MIT License" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo "Metapackage personnel pour l'installation automatisée de la Bebzerie." >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
