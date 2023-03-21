# Maintainer: Cabel <auravenbells at duck dot com>
# Contributor: metiis <aur at metiis dot com>
# Contributor: Julio Gutierrez <bubuntux at gmail dot com>
# Contributor: Martoko <mbastholm at gmail dot com>

pkgname=nordvpn-bin
<<<<<<< HEAD
<<<<<<< HEAD
pkgver=3.16.0
=======
pkgver=3.15.4
>>>>>>> 6d20973 (Update to 3.15.4)
=======
pkgver=3.16.0
>>>>>>> 2fe4724 (Update directly to 3.16.0)
pkgrel=1
pkgdesc="NordVPN CLI tool for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://nordvpn.com/download/linux/"
license=('custom')
depends=('libxml2')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install
source_x86_64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_amd64.deb")
source_i686=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_i386.deb")
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2fe4724 (Update directly to 3.16.0)
source_armhf=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_armel=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('ca6dcafff50256e8ed350257c361b4dec1971f86a0bd9eaae00c88f3d1e0ea73')
sha256sums_i686=('cf3c747a238a2fb340e0a4aa0ca820bd822b83d31fb2f8eac742e208e7bf5b2d')
sha256sums_armhf=('a9d40844114b93b25b43230464eea59bf8833be2fbee94c9ec060972dbd5cb5c')
sha256sums_armel=('8bc457eb4843cc3d7b714f5fc75bf6aa45a21871c3f5863739fb6a90a06ce428')
<<<<<<< HEAD
=======
source_armv7h=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_armhf.deb")
source_aarch64=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('f32846948e6da8fddb44c339c1ac92939af2cd074fb240e35de3a83c889da335')
sha256sums_i686=('90fa46def9adcc285e237aa5a7abc3f87e7d4328de3347c61b9b794b3db6a0e7')
sha256sums_armv7h=('ba014790dbee6523c9d518ae4da93cf09040dd210cba10606c891c1637d10b80')
sha256sums_aarch64=('e9088f23c34f18f37cbd7d8e9cfaf8222062c89bbc052a3d41a2f1e4f935af33')
>>>>>>> 6d20973 (Update to 3.15.4)
=======
>>>>>>> 2fe4724 (Update directly to 3.16.0)

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    
    mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/etc/init.d"
    rm -r "${pkgdir}/usr/sbin"
    echo "g nordvpn - -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
