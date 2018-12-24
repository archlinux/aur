# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=ddnet-skins
pkgver=20180808
pkgrel=2
pkgdesc="DDraceNetwork skin database"
arch=(any)
url="https://ddnet.tw"
license=('GPL')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://ddnet.tw/skins/zip/database.zip")
sha256sums=('bc9dec0801fec08e040091b2e803dac42a0340b348f327a851940ca6a9ae2e59')

prepare() {
  rm -rf $pkgname-$pkgver
  mv database.dir $pkgname-$pkgver
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/ddnet/data/skins/"
  install -Dm644 * "$pkgdir/usr/share/ddnet/data/skins/"
  
  cd "$pkgdir/usr/share/ddnet/data/skins/"
  
    # remove skins already provided by vanilla (default Teeworlds client)
  rm  "bluekitty.png"     \
      "bluestripe.png"    \
      "brownbear.png"     \
      "cammo.png"         \
      "cammostripes.png"  \
      "coala.png"         \
      "default.png"       \
      "limekitty.png"     \
      "pinky.png"         \
      "redbopp.png"       \
      "redstripe.png"     \
      "saddo.png"         \
      "toptri.png"        \
      "twinbop.png"       \
      "twintri.png"       \
      "warpaint.png"      \
      "x_ninja.png"
  
    # remove skins already provided by DDNet Client
  rm  "Ablush NeoN.png"        \
      "Apish Coke.png"         \
      "BadAnqelMonster.png"    \
      "Blind r0xr.png"         \
      "DuMoH.png"              \
      "Evil Puffi.png"         \
      "Flying Silex.png"       \
      "Hidden Assassin.png"    \
      "Irradiated Sunny.png"   \
      "Mobys Skull.png"        \
      "PaladiN.png"            \
      "Red Coke.png"           \
      "Shadow.png"             \
      "Sonic.png"              \
      "Straw Crytek.png"       \
      "Terrorist.png"          \
      "Volt.png"               \
      "antiantey.png"          \
      "aqua.png"               \
      "bauer.png"              \
      "blacktee.png"           \
      "bomb.png"               \
      "bunny.png"              \
      "caesar.png"             \
      "chera.png"              \
      "clefairy.png"           \
      "coala_bluekitty.png"    \
      "coala_bluestripe.png"   \
      "coala_cammo.png"        \
      "coala_cammostripes.png" \
      "coala_default.png"      \
      "coala_limekitty.png"    \
      "coala_pinky.png"        \
      "coala_redbopp.png"      \
      "coala_redstripe.png"    \
      "coala_saddo.png"        \
      "coala_toptri.png"       \
      "coala_twinbop.png"      \
      "coala_twintri.png"      \
      "coala_warpaint.png"     \
      "demonlimekitty.png"     \
      "dino.png"               \
      "dragon.png"             \
      "draw.png"               \
      "emo.png"                \
      "evil.png"               \
      "evilwolfe.png"          \
      "fuzzy_coala.png"        \
      "ghost.png"              \
      "ghostjtj.png"           \
      "giraffe.png"            \
      "greensward.png"         \
      "greyfox.png"            \
      "greyfox_2.png"          \
      "hammie-chew.png"        \
      "hedgehog.png"           \
      "jeet.png"               \
      "kintaro_2.png"          \
      "kirby.png"              \
      "kitty_bluestripe.png"   \
      "kitty_brownbear.png"    \
      "kitty_cammo.png"        \
      "kitty_cammostripes.png" \
      "kitty_coala.png"        \
      "kitty_default.png"      \
      "kitty_pinky.png"        \
      "kitty_redbopp.png"      \
      "kitty_redstripe.png"    \
      "kitty_saddo.png"        \
      "kitty_toptri.png"       \
      "kitty_twintri.png"      \
      "kitty_warpaint.png"     \
      "lightbulb.png"          \
      "m&mred.png"             \
      "m&myellow.png"          \
      "masterchief.png"        \
      "mermydon.png"           \
      "mermydon-coala.png"     \
      "mike.png"               \
      "monstee.png"            \
      "mouse.png"              \
      "musmann.png"            \
      "nanami.png"             \
      "nanas.png"              \
      "napoleon.png"           \
      "nersif.png"             \
      "nosey.png"              \
      "oldschool.png"          \
      "penguin.png"            \
      "pepsi.png"              \
      "pikminpurple.png"       \
      "pikminwhite.png"        \
      "pikminyellow.png"       \
      "random.png"             \
      "red_bird.png"           \
      "roman.png"              \
      "savage.png"             \
      "t2.png"                 \
      "tails.png"              \
      "tank.png"               \
      "tauren.png"             \
      "teerasta.png"           \
      "teledipsy.png"          \
      "telelaalaa.png"         \
      "telepo.png"             \
      "teletinkywinky.png"     \
      "troll.png"              \
      "ts2_contest_skin.png"   \
      "tweety.png"             \
      "veteran.png"            \
      "wartee.png"             \
      "whis.png"
}
