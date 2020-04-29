# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
# Contributor: Rhys Perry <rhysperry111 @ gmail.com>
pkgname=explusalpha
pkgrel=1
pkgver=1.5.14
pkgdesc="A collection of Emulators for retro gaming systems"
arch=('x86_64')
url="http://www.explusalpha.com"
license=('GPLv3')
depends=('gtk3' 'lib32-bluez-libs')
source=("$pkgname-$pkgver::http://www.explusalpha.com/home/general-info/platforms/linux/explusalpha.com%20Emu%20Bundle%201.5.14.tar.xz?attredirects=0"
        "icon-MSX.svg::https://upload.wikimedia.org/wikipedia/commons/9/95/MSX-Logo.svg"
        "icon-Neo.svg::https://upload.wikimedia.org/wikipedia/en/f/f3/Neo_Geo_logo.svg"
	"icon-Atari.svg::https://upload.wikimedia.org/wikipedia/en/0/08/Atari_2600_logo.svg"
        "icon-GBA.svg::https://upload.wikimedia.org/wikipedia/commons/8/8a/Gameboy_advance_logo.svg"
        "icon-GBC.svg::https://upload.wikimedia.org/wikipedia/commons/9/90/Game_Boy_Color_Logo.svg"
        "icon-Genesis.svg::https://upload.wikimedia.org/wikipedia/commons/7/74/Sega_genesis_logo.svg"
        "icon-NES.svg::https://upload.wikimedia.org/wikipedia/commons/0/0d/NES_logo.svg"
        "icon-NGP.png::https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/SNK_NeoGeo_Pocket_logo.png/461px-SNK_NeoGeo_Pocket_logo.png"
        "icon-PCE.png::https://upload.wikimedia.org/wikipedia/en/4/4e/PC_Engine_logo.png"
        "icon-Saturn.png::https://upload.wikimedia.org/wikipedia/en/4/42/SegaSaturn.png"
        "icon-SNES.svg::https://upload.wikimedia.org/wikipedia/commons/3/33/Super_Nintendo_Entertainment_System_logo.svg"
        "Explusalpha2600.desktop" "ExplusalphaGBA.desktop" "ExplusalphaGBC.desktop" "ExplusalphaMD.desktop" "ExplusalphaMSX.desktop"
        "ExplusalphaNeo.desktop" "ExplusalphaNES.desktop" "ExplusalphaNGP.desktop" "ExplusalphaPCE.desktop" "ExplusalphaSNES9x.desktop"
        "ExplusalphaSaturn.desktop")

md5sums=('abd630033cf29bc26c76953d56c6a914' 'a3078f8ec9b5e8368202229bb74c876d'
         '377cc589f28f92e3e23aded7c0692f11' 'a44ab8b192ca2c36cd5ea4b7f16ace5e'
         '063c8ed112890648644570b7304d915f' 'f3aa08d98b3a25a95647ab325226c591'
         'dfb5aa76514888c80779fe7cd9723c29' '827172ba9a2bc3931336f427f3c7ca29'
         'e6634fc3a9dda5b55245dfa0aee9b7e9' '227925816c7c5ff97f258f35a0939ef8'
         'bf00ffd718325224d25999afa22c2eb0' '7fb4e3357cb8e95f34febfa18ad551f5'
         '41df52e35459c889062de3723ed953ac' 'ec7d0dd30ab012e65bcd747b74fa013c'
         '750c6bfcb8b2fa7453ed8755b3c0c9d4' '3569168442e5ba4324af73a56ccbb05c'
         '12ca4ae93b0be1783ed0dd9899b9dcfe' '7720245376db6c73129a47ff9286bcc3'
         '1241f92782f2cc9b7d63cbdfb9da41b5' '0a1c342ea41cead1189c3711bbfb3a09'
         '76843a80d85e55827e9510f02425f1f4' '3a7ad6420b678ebe8579fa4dd0653de8'
         'b3f90aa6c1c2c81db36d727f1fbc041a')
_SRCNAME="explusalpha.com Emu Bundle 1.5.14"

package() {
    cd "$pkgdir"
    install -m777 -d "$pkgdir/opt/ExplusalphaEmu"
    install -m777 -d "$pkgdir/opt/ExplusalphaEmu/icons"
    install -m755 -d "$pkgdir/usr/share/applications/"

    cp -r $srcdir/"$_SRCNAME"/* "$pkgdir/opt/ExplusalphaEmu/"
    cp $srcdir/icon-* "$pkgdir/opt/ExplusalphaEmu/icons/"
    cp $srcdir/*.desktop "$pkgdir/usr/share/applications/"

}
