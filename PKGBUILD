# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Martin Erik Werner ("arand") <martinerikwerner@gmail.com>

_submodules=("acerspyro"
             "actors"
             "appleflap"
             "blendbrush"
             "caustics"
             "crosshairs"
             "dziq"
             "elyvisions"
             "fonts"
             "freezurbern"
             "john"
             "jojo"
             "jwin"
             "luckystrike"
             "maps"
             "mayhem"
             "mikeplus64"
             "misc"
             "nieb"
             "nobiax"
             "particles"
             "philipk"
             "projectiles"
             "props"
             "skyboxes"
             "snipergoth"
             "sounds"
             "textures"
             "torley"
             "trak"
             "ulukai"
             "unnamed"
             "vanities"
             "vegetation"
             "weapons"
             "wicked")

pkgname=redeclipse
pkgver=1.6.0
pkgrel=1
pkgdesc="free, casual arena shooter"
arch=(i686 x86_64)
url="http://redeclipse.net"
license=("ZLIB" "CCPL:by-sa" "CCPL:by" "custom")
makedepends=(ed sdl2_mixer sdl2_image enet)
depends=(sdl2_image sdl2_mixer enet hicolor-icon-theme)
source=(base-$pkgver.tar.gz::https://github.com/red-eclipse/base/archive/v$pkgver.tar.gz
        "redeclipse-1.5.5-build-with-system-enet.patch")
for _submodule in "${_submodules[@]}"; do
    source+=("$_submodule-$pkgver.tar.gz::https://github.com/red-eclipse/$_submodule/archive/v$pkgver.tar.gz")
done
sha256sums=('40af4276a7dd9ffc48e31f01e63343954b3851c5b446716cf0513f579c9949ef'
            '394cfa3f64385f05935467c88243432425304ef73dabd96fc35dcd66742f7bf9'
            'a361ae36e07aa4939becd8e7d45d8d39a59081f0d522370f1f7c640b557bbf1e'
            'a766dbc1f4ae55b20b695bdb01a158eb4fc6a033855750fde37582071dd36fc2'
            '6a86421b173a242093ff32a63150341755eee9c8979afdfbcab91290fad09de0'
            '497d3cf3d2659ab05b7232e7d079c2194bc77892eb50231de2296bafa0689500'
            'f831971c085e49bbac8999075968c0d2b3b5131891ee4c7c8f4182a31bdab5e2'
            'da2e505e3cc49e72c47acbc609b67a053447ce41c01bfaa289292a565e533b60'
            'dbfc50e5f5faf53c5dd837112195de0d80f275bc6f0b963e111e63e1272222e9'
            'ea051bb7176ce753094374a6a8cf27f4ea941004b44dc2c8362915a0ebb55e97'
            '329945e34b195fb916bead6881b881f6903b201557323eec89f05614d51187d0'
            'da9bf460e5b8681b8cbfd9d4159ed28ba276cd96184255a1d3775701f45f8d41'
            '6d8c6f757d98d61d4c567d501429f1991e9d3eb710cab3dc1c68d5833add1ef2'
            '118ff891b7109cdedba3011124edad1e28662904edcaa62dcd84aae246529d0b'
            '6862a143b85be7cc3949c41a48b52dd81871ba5f1cf8402b042564b8e8a164bd'
            '097b72c5edfeef3fb84e219a88e6dc7895ea41110309aadd1862960ef7d5c273'
            '7883219754253b38e7d7eab2e6c8c7a65e99406a32ebf20d3054eda96bbabbb6'
            '5d9dc1bb7a4bab27fb1f394b83641376e9dbc24ed0d1c47b0447b59e41ff7f42'
            '5079070363cc3e199e24c58db63f607d7767b3a9fe38b8dfe0124b4c2eec8e90'
            '0ce1090c6a9a0bfdf9d48b4593743f090aec0bb2bd1fe3f45f506ec3fc8afb2e'
            '33ac217c256d75818517c43a60a9672c4afad3ffdc0d1ba14d4fa7b9a2e6e234'
            'debdec13fc09c1e74f7cc2806c7e5f4e9024435672eb34cebd95a1a4bd1999a6'
            '594d5594b85b591f4e9c70c21c8816b8692d51525f0dad3b9ec61daa27c2f60a'
            '4246e52ca740e6130f536dc97726d71fe7aebfb5fbf4de895ed0dfa0f85979f6'
            'aec8fcfe2031fbf947316017421c3504b8aa4466f892ed4c80ad451783032ac3'
            'db57d9079f2c4a4db733b2f8608c4220f01c2728992546a6b6c409f32f52c639'
            'c29a48866dfc7028ffb928c505514e48f135e2e5d8c749e9c13bc696614305d3'
            'ec1df4577346bafb22f5b701d05c957e55837f4811b9fe9ca38db4be0270b834'
            'f21d16871cc4e378657e6933af26bf298df8c06ad777db322ce3f09175afd27c'
            '71d7c8ffefbd43b771e5afbc3166edcf88c3c15d781dbe4fb03da52fde21aa4c'
            'a5ad1ecb5d4a8736fb98e30a6d35e4c6dc4d41108b9ab34bcb2a6dd6111da28b'
            'eb9a44a83be694d0c5d16bd36599340c299994a571a669d6c76d2c7f88e4750e'
            '255425a825a95d273c7fd9bf9b503c53015dc8a3b619177b0c28f5a34c006d6f'
            'b1ba5796f6962508b243f08d74183aa7276ebcaca6588e9eb9d206a260db5da3'
            '620850ab25f1fd779212b85ddac5b5bef2e98c4e3665df365975195304ab68dc'
            '6b52c6aa300aa15ebf9a2d023c9a3e18969550353f18f54bccac2df5f1c6c35d'
            '868dbe58333d40d3a75ee316031437b6b2b177d665e4b8e91da54388932f20cb'
            '556dbed8b9ca521f52c29adbee9b364320bd1ecee69700d4b98c410445726991')

prepare() {
    for _submodule in "${_submodules[@]}"; do
        rmdir "base-$pkgver/data/$_submodule"
        mv "$_submodule-$pkgver" "base-$pkgver/data/$_submodule"
    done
    #patch -d "base-$pkgver" -p0 -i "$srcdir/redeclipse-1.5.5-build-with-system-enet.patch"
}

build() {
    cd "base-$pkgver"
    make -C src/ client server
}

package() {
    cd "base-$pkgver"
    make -C src/ DESTDIR="$pkgdir" prefix=/usr system-install
    install -Dm 0644 "doc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm 0644 "doc/all-licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/all-licenses.txt"
}

