pkgname=bebz-essentials
pkgver=0.1.0
pkgrel=1
pkgdesc="Packages de base pour la Bebzerie sur Arch"
arch=('any')
url="https://aur.archlinux.org"
license=('MIT')

# Dépendances (jdois en ajouter d'autre, j'ai pensé qu'a celles la pour l'instant)
depends=(
    'nvidia-dkms'
    'nvidia-utils'
    'steam'                 # Ajouter Wine et proton exp (si pas inclus avec steam) plus tard
    'discord'
    'networkmanager'
    'nm-connection-editor'  # Interface config réseau
    'bluez'                 # package bluetooth
    'bluez-utils'
    'git'
    'base-devel'            # outils pour compilation
)


package() {

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    echo "Metapackage personnel" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo "V0.1.0" >> PKGBUILD
}
