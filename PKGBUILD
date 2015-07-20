# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Martin Erik Werner ("arand") <martinerikwerner@gmail.com>

pkgname="redeclipse"
pkgver="1.5.3"
pkgrel="1"
pkgdesc="free, casual arena shooter"
arch=("i686" "x86_64")
url="http://redeclipse.net"
license=("custom" "CC0" "CCPL:by" "CCPL:by-sa" "ZLIB" "MIT")
makedepends=("ed")
depends=("sdl_image"  "libgl" "sdl_mixer" "hicolor-icon-theme" "glu")
install="redeclipse.install"
source=("base-${pkgver}.tar.gz::https://github.com/red-eclipse/base/archive/v${pkgver}.tar.gz"
        "acerspyro-${pkgver}.tar.gz::https://github.com/red-eclipse/acerspyro/archive/v${pkgver}.tar.gz"
        "actors-${pkgver}.tar.gz::https://github.com/red-eclipse/actors/archive/v${pkgver}.tar.gz"
        "appleflap-${pkgver}.tar.gz::https://github.com/red-eclipse/appleflap/archive/v${pkgver}.tar.gz"
        "blendbrush-${pkgver}.tar.gz::https://github.com/red-eclipse/blendbrush/archive/v${pkgver}.tar.gz"
        "caustics-${pkgver}.tar.gz::https://github.com/red-eclipse/caustics/archive/v${pkgver}.tar.gz"
        "crosshairs-${pkgver}.tar.gz::https://github.com/red-eclipse/crosshairs/archive/v${pkgver}.tar.gz"
        "elyvisions-${pkgver}.tar.gz::https://github.com/red-eclipse/elyvisions/archive/v${pkgver}.tar.gz"
        "fonts-${pkgver}.tar.gz::https://github.com/red-eclipse/fonts/archive/v${pkgver}.tar.gz"
        "freezurbern-${pkgver}.tar.gz::https://github.com/red-eclipse/freezurbern/archive/v${pkgver}.tar.gz"
        "john-${pkgver}.tar.gz::https://github.com/red-eclipse/john/archive/v${pkgver}.tar.gz"
        "jojo-${pkgver}.tar.gz::https://github.com/red-eclipse/jojo/archive/v${pkgver}.tar.gz"
        "jwin-${pkgver}.tar.gz::https://github.com/red-eclipse/jwin/archive/v${pkgver}.tar.gz"
        "luckystrike-${pkgver}.tar.gz::https://github.com/red-eclipse/luckystrike/archive/v${pkgver}.tar.gz"
        "maps-${pkgver}.tar.gz::https://github.com/red-eclipse/maps/archive/v${pkgver}.tar.gz"
        "mayhem-${pkgver}.tar.gz::https://github.com/red-eclipse/mayhem/archive/v${pkgver}.tar.gz"
        "mikeplus64-${pkgver}.tar.gz::https://github.com/red-eclipse/mikeplus64/archive/v${pkgver}.tar.gz"
        "misc-${pkgver}.tar.gz::https://github.com/red-eclipse/misc/archive/v${pkgver}.tar.gz"
        "nobiax-${pkgver}.tar.gz::https://github.com/red-eclipse/nobiax/archive/v${pkgver}.tar.gz"
        "particles-${pkgver}.tar.gz::https://github.com/red-eclipse/particles/archive/v${pkgver}.tar.gz"
        "philipk-${pkgver}.tar.gz::https://github.com/red-eclipse/philipk/archive/v${pkgver}.tar.gz"
        "projectiles-${pkgver}.tar.gz::https://github.com/red-eclipse/projectiles/archive/v${pkgver}.tar.gz"
        "props-${pkgver}.tar.gz::https://github.com/red-eclipse/props/archive/v${pkgver}.tar.gz"
        "skyboxes-${pkgver}.tar.gz::https://github.com/red-eclipse/skyboxes/archive/v${pkgver}.tar.gz"
        "sounds-${pkgver}.tar.gz::https://github.com/red-eclipse/sounds/archive/v${pkgver}.tar.gz"
        "textures-${pkgver}.tar.gz::https://github.com/red-eclipse/textures/archive/v${pkgver}.tar.gz"
        "torley-${pkgver}.tar.gz::https://github.com/red-eclipse/torley/archive/v${pkgver}.tar.gz"
        "trak-${pkgver}.tar.gz::https://github.com/red-eclipse/trak/archive/v${pkgver}.tar.gz"
        "ulukai-${pkgver}.tar.gz::https://github.com/red-eclipse/ulukai/archive/v${pkgver}.tar.gz"
        "unnamed-${pkgver}.tar.gz::https://github.com/red-eclipse/unnamed/archive/v${pkgver}.tar.gz"
        "vanities-${pkgver}.tar.gz::https://github.com/red-eclipse/vanities/archive/v${pkgver}.tar.gz"
        "vegetation-${pkgver}.tar.gz::https://github.com/red-eclipse/vegetation/archive/v${pkgver}.tar.gz"
        "weapons-${pkgver}.tar.gz::https://github.com/red-eclipse/weapons/archive/v${pkgver}.tar.gz"
        "wicked-${pkgver}.tar.gz::https://github.com/red-eclipse/wicked/archive/v${pkgver}.tar.gz")
sha256sums=('94b0475c7c161d4fdb59a9ebe0d740ec07b1934abf348d78d4f127f369d912f8'
            '18718286a72298b0a016d147524bc53094c4ad3897859ec8422131b5acc9bd3f'
            '34825b5bb7f79bf9518e5e48f01ecb720cc559bb969575b93da05b5305c209cb'
            '05c5aae92779ef8b6feb74ee396d27001aa8692610c35b33421419dd0d0bc4b2'
            'c0fb3257fd4a9b425bfa015ff0126807af85dbada89223765689e618ad7d4b72'
            '25b0366b0e434049d382fdeda0b62e38a7fdadf398d714713d829908f10dbb3f'
            '732e0a874ad39d4ee329e4b82badd8e3b513ad4a5a6f7ea5c5c2d30a42839e6e'
            '29d8554151789578cbce17718d911c36e3453ee3b700b96b4ca0b9d4f2391468'
            'b88246a3a194afd0e3928d447d9e49c8869ce157c005dca2ad7610479344f62a'
            '9669ca25a3cdffaf6172829a1e04dad51f43bf4bd98b794d1574a18dded0c078'
            '8d02259d0878b91c2c16b8c323f2bbf8fba521a5694f9bb160ca5f7c32b0bcd2'
            'a97b45a1e095c11f1b9b5c34ed2f28e6427a784c56fc0a143288638a59cc036a'
            '539873a19cbafd10499959619199791ebc6feabcde20c4db1e9298dea14c85e4'
            '21516564ba832507ecb93f05d03e662bd4dc0944d7bc800bc1127c96d941b823'
            '71a79ec665e99268637952bd883afcda02345c9944494822fe96b45511c410b8'
            '95a9ce7bfa8bc4e38da8197ef85e530e312ba040cf772bae99e84745cc95c9c2'
            '57a92abff536d459e413d424e8a948c2951a7f476dbb00831bf54ddfedff42ce'
            'aec506cf659452a717430fe6104e0624eac5bd59f22c64ca5033d65cb4fc15de'
            '159e98527ea953e1af8f49808ad61f34d08189b720e070463ff88a4a044b3622'
            '759b46e2d8edc2ac893dd8fce8820b208789d9bc2c63679db35366b88d1e8d71'
            'ea4daa2e02c13bbb8d0ba18ad7d3dfdc0f39355dccc36c556bbaec88aeaa13e8'
            'd2beb17e7b7928718d5c4d9697238027523ddd6a2f168d900b8d599d93ceb075'
            '79f474367f808faa7293e73851e0331a354760db0dd0b8d061f1d74b921a70e9'
            'f17df31c857abd7106159e82ba92b252db8ce68df21a893023d3017d8d2ac943'
            'ebcc960b5e3ecee80e04aec8335554ffdb36ecc030791666903a85cad469dede'
            'a59c604d134bf0e82d31340878c4790060dc82f7a4417ada1d7782da09b3ae3f'
            '4607d60be7080b0ac5c6ef801f158d2ba6e79982e9861eecdd15698a5c2d31b3'
            '78e9bb131fe144b516ce29be6c9f64f2991731e49935576caa3ed999ca2fd377'
            '638fb7ac0e0d8eb1f13c7a01d00d31ce7844c06d8907ad2a20ea571b094b3b7e'
            'bd7da14d9e715d6dcc2687921f668739d0ba45a9f01350c1b5347e956648a242'
            'bcd9a0f22314c0bb98fc193f18f04a3cc9f1aa6b83c70a02de34b779cc166ce1'
            'c076f3f50caac5bec5889fc8e11028882b7a39cee8560684918c3a0eb847228d'
            '23d70fb68fe34ba9c952f74b2ec6ca30b9dda8664248db10f5b434cb9c3516be'
            '0fc5a75c6b0a2a9c90a664e2b9ec958928b3059f03e90228cca547f376532b61')

prepare() {
    cd "${srcdir}/base-${pkgver}"
    for i in \
    acerspyro actors appleflap blendbrush caustics crosshairs elyvisions \
    fonts freezurbern john jojo jwin luckystrike maps mayhem mikeplus64 misc \
    nobiax particles philipk projectiles props skyboxes sounds textures \
    torley trak ulukai unnamed vanities vegetation weapons wicked
    do
        rmdir "data/${i}"
        mv "${srcdir}/${i}-${pkgver}" "data/${i}"
    done
}

build() {
    cd "${srcdir}/base-${pkgver}"
    make -C src/ client server
}

package() {
    cd "${srcdir}/base-${pkgver}"
    make -C src/ DESTDIR="${pkgdir}" prefix=/usr system-install
    install -Dm 0644 "${srcdir}/base-${pkgver}/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -Dm 0644 "${srcdir}/base-${pkgver}/doc/all-licenses.txt" "${pkgdir}/usr/share/licenses/${pkgname}/all-licenses.txt"
}
