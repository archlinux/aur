# Maintainer: Peter Sutton <foxxy(at)foxdogstudios(dot)com>
# Contributor: Daniele Paolella <danielepaolella(at)email(dot)it>
# Contributor: Artem Borisovskiy

pkgname=hydrogen-drumkits
pkgver=20170105
pkgrel=1
pkgdesc='Hydrogen drum kits'
arch=(any)
url='http://www.hydrogen-music.org/hcms/node/16'
license=('GPL2')
depends=(hydrogen)
changelog=ChangeLog

_baseurl=http://downloads.sourceforge.net/project/hydrogen/Sound%20Libraries/Main%20sound%20libraries
source=("$_baseurl/3355606kit.h2drumkit"
        "$_baseurl/BJA_Pacific.h2drumkit"
        "$_baseurl/Boss_DR-110.h2drumkit"
        "$_baseurl/Classic-626.h2drumkit"
        "$_baseurl/Classic-808.h2drumkit"
        "$_baseurl/ColomboAcousticDrumkit.h2drumkit"
        "$_baseurl/DeathMetal.h2drumkit"
        "$_baseurl/EasternHop-1.h2drumkit"
        "$_baseurl/ElectricEmpireKit.h2drumkit"
        "$_baseurl/ErnysPercussion.h2drumkit"
        "$_baseurl/ForzeeStereo.h2drumkit"
        "$_baseurl/HardElectro1.h2drumkit"
        "$_baseurl/HipHop-1.h2drumkit"
        "$_baseurl/HipHop-2.h2drumkit"
        "$_baseurl/K-27_Trash_Kit.h2drumkit"
        "$_baseurl/Millo-Drums_v.1.h2drumkit"
        "$_baseurl/Millo_MultiLayered2.h2drumkit"
        "$_baseurl/Millo_MultiLayered3.h2drumkit"
        "$_baseurl/Synthie-1.h2drumkit"
        "$_baseurl/TD-7kit.h2drumkit"
        "$_baseurl/TR808909.h2drumkit"
        "$_baseurl/Techno-1.h2drumkit"
        "$_baseurl/VariBreaks.h2drumkit"
        "$_baseurl/YamahaVintageKit.h2drumkit"
        "$_baseurl/circAfrique v4.h2drumkit")

md5sums=('5dad41a4f0fb5a9fda0af98b9f553060'
         'cde7a74a06edde3b5f85435c29909891'
         'f528892879ee04621055c4a3f12166c1'
         '86dbdb8d2f9b12690e92211d36c6fe7d'
         'c08d5093fc28a30a7542f0c89493e807'
         'cb11827e185ab5a6906967901495884b'
         '0465025dcf6659657b773874d168c27b'
         '8750fcbe186e49a89bc18a9237ee6604'
         'df1bd778148cc25d8f63a8cc7aa91fcb'
         '0e96f5971d5db887a186d5739c12ab77'
         'c6cd87bf54e0a760c5f4fecbff979100'
         'f953edf3f4227d786df59b544370e379'
         '7f52d6ac56a31f5b618657d40d4eb86e'
         '217f38ebf2849b20ff3a5dca1994be08'
         'f445c60d4625a6bfe6bb9dbac1ac0aa7'
         '4c895d59c3bc5f3322d14789de345be2'
         '2da5b8ee87bce3e67464c61ba0b722dd'
         '79ca7360784ec72959aa07c3c584d76c'
         '33f02627ac1489e4ab52c5f078c538b9'
         '635274624e0a739c51b70f72a58cfcec'
         '1db9cce82fbdaebac1ab4608be5853ea'
         'f91912fc88361dd8954c11f2e602aa25'
         'a9c305829cd23c28ffd1647cb5c0bdfd'
         '8f63997dd789179fa009f84cc515fb3e'
         'e9d8604d2089abc764e54d1f209900b7')

package() {
    local _drumkitsdir="$pkgdir/usr/share/hydrogen/data/drumkits"
    local _drumkits=('3355606kit'
                     'BJA_Pacific'
                     'Boss_DR-110'
                     'Classic-626'
                     'Classic-808'
                     'ColomboAcousticDrumkit'
                     'DeathMetal'
                     'EasternHop-1'
                     'ElectricEmpireKit'
                     'ErnysPercussion'
                     'ForzeeStereo'
                     'HardElectro1'
                     'HipHop-1'
                     'HipHop-2'
                     'K-27_Trash_Kit'
                     'Millo-Drums_v.1'
                     'Millo_MultiLayered2'
                     'Millo_MultiLayered3'
                     'Synthie-1'
                     'TD-7kit'
                     'TR808909'
                     'Techno-1'
                     'VariBreaks'
                     'YamahaVintageKit'
                     'circAfrique v4')

    install -d "$_drumkitsdir"
    cp -a "${_drumkits[@]}" "$_drumkitsdir"
    find "$_drumkitsdir" -type d -exec chmod 755 {} \;
    find "$_drumkitsdir" -type f -exec chmod 644 {} \;
}
