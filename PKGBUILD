# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
epoch=1
pkgver=23.12.1
pkgrel=1
pkgdesc='Google Noto TTF fonts (lite version)'
arch=(any)
url='https://fonts.google.com/noto'
license=(custom:SIL)
optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
            'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
provides=(ttf-font noto-fonts)
conflicts=(noto-fonts)
_url="https://github.com/notofonts/notofonts.github.io/raw/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoSans/hinted/ttf/NotoSans-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
        "${_url}/NotoSansMono/hinted/ttf/NotoSansMono-"{Black,Bold,Light,Medium,Regular,Thin}.ttf
        "${_url}/NotoSerif/hinted/ttf/NotoSerif-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
        "noto-fonts-license::${_url}/LICENSE"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('feea9738c5e4999e48431434cbec4b131127323ade937128431aed02f5974fcd'
            '733f548bc5f0037096d9984c2260ed34fd1763a2071e1ded9a8b50c87b84de47'
            '8e6da60154ae06e5e860777c4ccf8c7338d9b96ba34c1222db40a367d79b35dc'
            '5c2e7d652627c967d2d24936c5f104f9ed40219c3118de8022ff9728610771ff'
            'a61b2c3ad0343a3ae2d3ca4088a861123729c49038f574150b8726e0d9a8c5f8'
            'b55265b4d7cfe41585fd727a26ad15e177e1f93d44ca3c110fa67ee623453986'
            '55ff1cf3819a83c7b61e0d6ce490c3377c05b53f67b5536b065cb26dd4bf9cfb'
            '3bab84ad15fd07a64dff5cfc23fba94b63c0ca5e3c99757969a894babdb815f3'
            '62eb7024a800385d955bd2e7d87dba5e76523d4ba61924f05fa6d0423ac3e9ca'
            '61b72eacd39533f0e5916cbb458abd7b3cf870667f63f3069dac2a75aa0317a2'
            '2c985b5e757d7aaab76e43526437ff3bff120042ce3301fe308ed2b8ae5d6f64'
            '8e4977100735a4a83b26d10e17445468d4c72674c9f823a4274083d832064161'
            'f2a28df76a1ff7d43648d2625c895468ba3ca2910e0c3ce133361225c0064cb5'
            'a21ea0ba6ea49fda7b34ca39a504b487f1130885d36e1a4f9f4255b3ba6994bc'
            '9c9dc46df01c3acee14690fc1be60f6c863675b5ac9ee190f304656dbb9ba9aa'
            '53e262499b3e6b4e7274dcc4840e9374c8d9c4a4fad48227a38d8cedd2e34c40'
            '65b5e2b2c4a1fba9ae8be1f026cb35b03dcb8886d9b2a4147054fde12f7e767d'
            '7c430e89bd442c5d02f947ca190fc78cb54136fc3f32eca9a7a3c492820e7074'
            'cfd559b51cfb2e60da18625ae2d28bd23ce54cd3bf92811220f2e8300c159087'
            '5628479f914a4bfa888a8a14ee2e9abae672ec8f0ca27b400adb2a3c7d9d9bcd'
            '90d365f87d72af449806ca8c9949786aab38527b20559850840f1d2968d56f54'
            '3436a0e99bf814aae77bd5868f99ee05278f4bc43c0db3ce8a3b4185d43df994'
            '637c44b0dbd0df16a969548483b01612dd095e306761af14072ae3ab69389b4f'
            'a6e7e4714a79c891bdf8038979f5682080ca0583abf261999f0cfd09d87906f3'
            '1aacab3e1a1339b7870a12fa9e586849be073bbab10518685b84e49bee74c3a5'
            'a871ba223abcbcc9bc1a222ab6d4d20266a2b4eb7ecea15fdb4c8c7133da0c5f'
            '0e747f685c02d37987ada80179cb1bea81827b078bf41c592a6d16b52f875ee2'
            '504b8ec55d003cade88fb0a7bb93254ad81fd1cb29f4818d260300dbaef5d37b'
            '6569a6782763d23a971798edeb8e99439a16feb4a3aa665c02f5ab338903dfba'
            'c87c3fd876f9f6b1c17a32ca7a1ea43514a2fd70de467aaea493a85d2f7f1775'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884')

package() {
  install -Dm644 Noto*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
  install -Dm644 noto-fonts-license "$pkgdir"/usr/share/licenses/noto-fonts/LICENSE

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
