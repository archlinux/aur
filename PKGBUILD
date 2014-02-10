# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-data
pkgver=2.0.6
pkgrel=6
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
opdepends=('srb2: "Sonic Robo Blast 2" game'
           'srb2-bin: "Sonic Robo Blast 2" game, precompiled')
source=("http://alam.srb2.org/SRB2/$pkgver-Final/Resources/drill.dta"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/knux.plr"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/music.dta"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/rings.wpn"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/soar.dta"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/sonic.plr"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/srb2.wad"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/tails.plr"
        "http://alam.srb2.org/SRB2/$pkgver-Final/Resources/zones.dta"
        "http://trac.srb2.org/export/7281/SRB2/tags/SRB2v2.0.6/src/sdl/SDL_icon.xpm")
sha256sums=('8ee1a16ca4ab544a81b240a72f87c344a3697ce58f632b33e52157f95c15176f'
            'd24f0f15de6f402065636ce93f7389a78a44f4c9071c512f6d4ab5ba1a995941'
            '495dcbe35f79990a0601dcc6d1d828706a66a10f65586ebdba98f2c66768163a'
            'f156f040814441def7336981e9d432ad1bfd44e5c8b4c0346e43f9d289abe31e'
            '87fcfd1c159f47dc16093fdefe6e647ceaa909a574f2db2c44450e8b15b45dbe'
            '36650190dea27322ea5728abcb2f3184aaf66b9d21791349ed8050fc3f061335'
            'e71309d088be3ebd55ece802f560ef8f23d6e7ee854b052c0a62dfbd0336156b'
            '1cfc070a474be46fdcfbf4e6ac09f95ddc5b6bca8d0a654f9b53f1760d360452'
            '730283649acbf033cd19f8d9149b746aae261c89572748e9872261ac946aa9e2'
            '25b73393baa18ac60782c3b4172c1d4345649322e420bbfe284e542445987d3f')

package() {
  install -d "$pkgdir"/usr/share/games/srb2
  install -m644 {drill,music,soar,zones}.dta {knux,sonic,tails}.plr rings.wpn \
    srb2.wad "$pkgdir"/usr/share/games/srb2

  # icon for .desktop files
  install -Dm644 SDL_icon.xpm "$pkgdir"/usr/share/pixmaps/srb2.xpm
}
