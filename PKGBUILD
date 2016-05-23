# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=teeworlds-ddnet-skins
pkgver=20160523
pkgrel=1
pkgdesc="Skins from DDraceNetwork for Teeworlds clients"
arch=(any)
url="https://ddnet.tw"
license=('GPL')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://ddnet.tw/skins/zip/database.zip")
md5sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
  rm -rf $pkgname-$pkgver
  mv database.dir $pkgname-$pkgver
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/share/teeworlds/data/skins/
  install -Dm644 * "$pkgdir"/usr/share/teeworlds/data/skins/
  
  cd "$pkgdir"/usr/share/teeworlds/data/skins/
  
    # remove skins already provided by vanilla (default Teeworlds client)
  rm "bluekitty.png" "bluestripe.png" "brownbear.png" "cammo.png" "cammostripes.png" "coala.png" "default.png" "limekitty.png" "pinky.png" "redbopp.png" "redstripe.png" "saddo.png" "toptri.png" "twinbop.png" "twintri.png" "warpaint.png" "x_ninja.png"
  
    # remove skins already provided by DDNet Client
  rm "Ablush NeoN.png" "Apish Coke.png" "BadAnqelMonster.png" "Blind r0xr.png" "DuMoH.png" "Evil Puffi.png" "Flying Silex.png" "Hidden Assassin.png" "Irradiated Sunny.png" "Mobys Skull.png" "PaladiN.png" "Red Coke.png" "Shadow.png" "Sonic.png" "Straw Crytek.png" "Terrorist.png" "Volt.png" "antiantey.png" "aqua.png" "bauer.png" "beast.png" "blacktee.png" "bomb.png" "bunny.png" "caesar.png" "chera.png" "clefairy.png" "demonlimekitty.png" "dino.png" "dragon.png" "draw.png" "emo.png" "evil.png" "evilwolfe.png" "fuzzy_coala.png" "ghost.png" "ghostjtj.png" "giraffe.png" "greensward.png" "greyfox.png" "greyfox_2.png" "hammie-chew.png" "hedgehog.png" "jeet.png" "kintaro_2.png" "kirby.png" "lightbulb.png" "m&mred.png" "m&myellow.png" "masterchief.png" "mermydon.png" "mermydon-coala.png" "mike.png" "monstee.png" "mouse.png" "musmann.png" "nanami.png" "nanas.png" "napoleon.png" "nersif.png" "nosey.png" "oldman.png" "oldschool.png" "penguin.png" "pepsi.png" "pikminpurple.png" "pikminwhite.png" "pikminyellow.png" "random.png" "red_bird.png" "roman.png" "savage.png" "t2.png" "tails.png" "tank.png" "tauren.png" "teerasta.png" "teledipsy.png" "telelaalaa.png" "telepo.png" "teletinkywinky.png" "troll.png" "ts2_contest_skin.png" "tweety.png" "veteran.png" "voodoo_tee.png" "wartee.png" "whis.png"  
}
