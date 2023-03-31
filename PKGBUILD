# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Artem Borisovskiy

_pkgname=hydrogen-drumkits
pkgname=$_pkgname-flac
pkgver=20220929
pkgrel=4
pkgdesc='Hydrogen drum kits (FLAC format)'
arch=(any)
url='https://sourceforge.net/projects/hydrogen/files/Sound%20Libraries/'
license=(GPL2)
optdepends=('hydrogen: use the drumkits with hydrogen')
makedepends=(flac python sox)
provides=($_pkgname)
conflicts=($_pkgname)
changelog=ChangeLog
_sourcebase="https://sourceforge.net/projects/hydrogen/files/Sound%20Libraries/Main%20sound%20libraries"
source=(
  'convert-samples.py'
  "$_sourcebase/3355606kit.h2drumkit"
  "$_sourcebase/BeatBuddy_Kit.h2drumkit"
  "$_sourcebase/BJA_Pacific.h2drumkit"
  "$_sourcebase/Boss_DR-110.h2drumkit"
  "$_sourcebase/circAfrique%20v4.h2drumkit"
  "$_sourcebase/Classic-626.h2drumkit"
  "$_sourcebase/Classic-808.h2drumkit"
  "$_sourcebase/ColomboAcousticDrumkit.h2drumkit"
  "$_sourcebase/DeathMetal.h2drumkit"
  "$_sourcebase/EasternHop-1.h2drumkit"
  "$_sourcebase/ElectricEmpireKit.h2drumkit"
  "$_sourcebase/ErnysPercussion.h2drumkit"
  "$_sourcebase/ForzeeStereo.h2drumkit"
  "$_sourcebase/Gimme%20A%20Hand%201.0.h2drumkit"
  "$_sourcebase/HardElectro1.h2drumkit"
  "$_sourcebase/HipHop-1.h2drumkit"
  "$_sourcebase/HipHop-2.h2drumkit"
  "$_sourcebase/K-27_Trash_Kit.h2drumkit"
  "$_sourcebase/Lightning1024.h2drumkit"
  "$_sourcebase/Millo-Drums_v.1.h2drumkit"
  "$_sourcebase/Millo_MultiLayered2.h2drumkit"
  "$_sourcebase/Millo_MultiLayered3.h2drumkit"
  "$_sourcebase/SF3007-2011-Set-03.h2drumkit"
  "$_sourcebase/Synthie-1.h2drumkit"
  "$_sourcebase/TD-7kit.h2drumkit"
  "$_sourcebase/Techno-1.h2drumkit"
  "$_sourcebase/The%20Black%20Pearl%201.0.h2drumkit"
  "$_sourcebase/TR808909.h2drumkit"
  "$_sourcebase/VariBreaks.h2drumkit"
  "$_sourcebase/YamahaVintageKit.h2drumkit"
)
sha256sums=('9b5421520553429b80108ad0d4e613bc83ee27b39437d7dc55bae63148004373'
            '96b1d325fd52e97d7b99ca9191cb376e430ecea1f83d12281f314e30f20fa121'
            'abc823a4e1ec52da4dae41a6c6712d9b04866c16b13b353bf756427f780c3b94'
            'a485753a2a60a1ce30e782784c0f26a84bbbee6bdb324b40c04a1f09f3668305'
            '5debdfb050f639478725af134d315649f242142f84691ce1409cd9f56f6943be'
            'f09ff7e46310409b8ec7f180193cda6bb69e2a67d5e7f78f8c1c1954bb9a3a2c'
            '3e95845d821129b119dea47fd56eadbb17da74b3a95a2154cac31a037b8a6f66'
            '6be9d2dba736bfcbc85e31ecf744c74b6620143e4fdc198309c4786951077391'
            '30d30e6c9aeb25597454034cee58495b410a8f95b3d689c9a0c4e2915af7871f'
            '7ae4f8e7bf52b84637100b6f781e94752ad738626cff912c7704522ea692fbe7'
            '14ed0cd45097471e3f9775958f40441c1c2886d5594e0111e2b0b7e63b5da00f'
            '7229f52268483119c3a8b1e62dc85f801e37b6c34834e8c603d8aaec0445c5f9'
            'daccb09332bf6aac09b83f9605a084120a9decff1447d02cc68d16b00f101546'
            '37b9f1d6d8fdf2a65aef5fcde5ac305c89983e1e23ce5b8194922640cce9146d'
            'f0cd2e52f0dbc8d6a001f203ee47cd691d8d028d30501ce332a52659aa62a07a'
            'cfde7e4c7a25f0d72d0674b4d849471b9d309e28372709b509e743aad8c30d5c'
            'd194d2d47cd33d09842ecb6db74783aaa89368e69a964868c7fd2feb3e1b7613'
            'e2c586017bc4952976b8af5447435e7fa5109308861b5f5be3213d86346bd972'
            'ad88e46d6e07a046cb5443e5bea4cc7645be992fc85e24853372cf5562c5ee24'
            'f41377b32b154c809984e11ebaf0b7cfd9bac2ecc26b78c8de7c9bbd243f9310'
            'c43d5b25938e95bcce4a204892e668b289f419b993e006bdf3f28c9c374b10c9'
            'c81cebee6a4d0df70fee7456c13bbdfe2c50b39b62888cb03c0768f885eb74dd'
            '5927572af24f9a2737f94c7c8e816e22d6b28f00e19d575495c1a97351a79096'
            'cffa12c5a176d9c9532bafacba773c0a0f7e2fe71ea5a14dae402d2de0726ccb'
            'adcc4a3023708fab46108acfc99dfc04e2b2b62bb21aa87ed8a027ccbb46b576'
            '4e9400c2bb7d06f0271bcbf2e052235fe8500095d6e6dfcd8fcb0593571f110b'
            '83e072ef8e8783d861ce500a8082161392e49853a54335823e1cd7f7874c8504'
            '4fb52d1bbdda886db4b742c6de33d7475ef5088076c18533bd705c588f69a87b'
            '4637f0c39b488074943030d6cb0274f3e35d1da221eb6d078c15ea118f4e496d'
            'ed7bfa21abc05712ea89860b7e680808d14d567d49377fbc65914a9dd518e14d'
            '17005f5c79d92af3caef52ea313b1ac5bc49f1eefa4462b22980dec2b031bf27')
_drumkits=(
  '3355606kit'
  'BeatBuddy Kit'
  'BJA_Pacific'
  'Boss_DR-110'
  'circAfrique v4'
  'Classic-626'
  'Classic-808'
  'ColomboAcousticDrumkit'
  'DeathMetal'
  'EasternHop-1'
  'ElectricEmpireKit'
  'ErnysPercussion'
  'ForzeeStereo'
  'Gimme A Hand 1.0'
  'HardElectro1'
  'HipHop-1'
  'HipHop-2'
  'K-27_Trash_Kit'
  'Lightning1024'
  'Millo-Drums_v.1'
  'Millo_MultiLayered2'
  'Millo_MultiLayered3'
  'SF3007-2011-Set-03'
  'Synthie-1'
  'TD-7kit'
  'Techno-1'
  'The Black Pearl 1.0'
  'TR808909'
  'VariBreaks'
  'YamahaVintageKit'
)

build() {
  cd "$srcdir"
  chmod +x convert-samples.py
  ./convert-samples.py "${_drumkits[@]}"
}

package() {
  local _drumkitsdir="/usr/share/hydrogen/data/drumkits"

  for drumkit in "${_drumkits[@]}"; do
    cd "$srcdir/$drumkit"

    install -Dm644 drumkit.xml -t "$pkgdir$_drumkitsdir/$drumkit"
    install -Dm644 *.flac -t "$pkgdir$_drumkitsdir/$drumkit"

    for doc in README* *.h2song; do
      if [[ -f "$doc" ]]; then
        install -Dm644 $doc -t "$pkgdir/usr/share/doc/$pkgname/$drumkit"
      fi
    done

    for lfile in LICEN?E* COPYING* license.*; do
      if [[ -f "$lfile" ]] && ! grep -q 'GNU GENERAL PUBLIC LICENSE' $lfile ; then
        install -Dm644 $lfile -t "$pkgdir/usr/share/licenses/$pkgname/$drumkit"
      fi
    done
  done
}
