# Maintainer: Lncvrt <lncvrtreal@gmail.com>
pkgname=lncvrt-games-launcher
pkgver=1.9.2
pkgrel=1
pkgdesc="The official Lncvrt Games Launcher AUR Package!"
arch=('x86_64')
depends=('gtk3' 'libx11')
url="https://games.lncvrt.xyz"
source=(
    "https://archive.org/download/lncvrt-games-archive/lncvrt-games-launcher-new/Lncvrt-Games-Launcher-${pkgver}-linux-x64.deb"
)
sha256sums=(
    '11453a420d97dbc3a490476cfbf7d19fc8725507442e463df89119816a4de7a3'
    '459c15b6f69f7026963b2090a22a3de3729ae8f54ad23b3c72e8b8a15a937115'
    'c40be4e50bca8c58fa0114aec50e62dc85b8747cd0c61ed7b464e3b5d1ae1bd5'
    'd5272d77054a9a3f010760bf8ff78babf59eaecd31e5f695f5a7156d34252219'
    '6e812d3fcdce162d740fb7f4a0ad0a2c4b2485103b9569ed8062b952a9445c4f'
)
options=('!strip')
package() {
    bsdtar -xf "${srcdir}/Lncvrt-Games-Launcher-${pkgver}-linux-x64.deb" -C "${pkgdir}" data.tar.*
    bsdtar -xf "${pkgdir}/data.tar."* -C "${pkgdir}"
    rm -f "${pkgdir}"/data.tar.*
}
