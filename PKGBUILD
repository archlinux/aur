# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
pkgver=20210326
_commit=7697007fcb3563290d73f41f56a70d5d559d828c
pkgrel=1
pkgdesc="Google Noto TTF fonts (lite version)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
            'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
provides=(ttf-font noto-fonts)
conflicts=(noto-fonts)
_url="https://github.com/googlefonts/noto-fonts/raw/${_commit}"
source=("${_url}/hinted/ttf/NotoSans/NotoSans-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
        "${_url}/hinted/ttf/NotoSansMono/NotoSansMono-"{Black,Bold,Light,Medium,Regular,Thin}.ttf
        "${_url}/hinted/ttf/NotoSerif/NotoSerif-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
        "noto-fonts-license::${_url}/LICENSE"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('2059bc762f958866a4e58b7c202396af5c8557382a9e34dbbd82f978499a8b1b'
            'fa3be6b4a77521d040ed94a13ae002229239d3fffcafc0aa2e5d90cbc4bc061b'
            '4439dc44113d49beb0abfdc0def48719deda6f163f3337122ea509c90eed1d0d'
            '83f5f027d9678405e3fa5769f32cc85d0c5c15e85e7c2428e3393389b43c17a6'
            '156aa6fc822430fabe600b4f6515aafb35417cac9104d3004a5d77f1d480352b'
            '193cf399bcc7105760398f727e41952bebe4a4f8e2a8ea49f3181ec0fb4a2368'
            '1b2620d30e70bdd068e9bf6f70d61584042f1ba17d268f3764e654d238d6d6ae'
            '30ca1a9e9caae1ea676ba5fe3aec1b852c5f57c5455bc61742fcf3ed3a75053e'
            'a4846fb96fb83c21bd3fde31519f8c4154ca958a95613f4fad2b46f693655539'
            '9cb49a54e520423033f9727be2e53e4805a60656deb09c219740d8e5f3e033ac'
            '827da4cc7d7e7131fb4e674f828ca3b95fb721195a2bde6c0aacfba43754f364'
            'a4b2eb960006d5fa69d96753d8c2382c5873e14286410dda8e15366f2793cad9'
            '9156b21358155c81b686fdf44c98aecc40de6133ab4d5ede1d83328d6509b24a'
            '7e792fb65447c8d795c2d8f4ef95c779079e8b4dc1fc506d831d98d8992e7796'
            '6e04dad05b80683319b8bfa272815c18f49c29f446f3fcf0516585228a352ed4'
            '756123f714fea75cd12fa9607296dc30cb0235fd0eed6295be7741f4d20986dc'
            '3f5a1e36b94c53ec88894e1335e3a4b87417559d0b63cac5b3235bdd2e41f41f'
            '6a248f0958c3605ed565c0cab2127c0f4604cdab52288e1c059a812f7279c64f'
            'f5a0540073071ed1032014b9953fc010c2ec1171a4015acfed27570280b720ed'
            'f0b0112006c42accffd01001ba6a58ece8fb97ee39413c211ceabfa504149e57'
            '5835c48e68d809ec784c728e61c0949c18d5a6c6ec5a0ae809559fdaab21e3ab'
            '3609c22b9bae99f384fe4e1db7b647a9af4e5bac479ee9571b2e81bc4a845101'
            '2cb18340bec25ce4217aff7c355f07a10a268127a57c3ee9bbfd7287493cfecb'
            'd77a2278496084ddd5d87cf71e137b2a239418f1f4e94ac9dea066a31c0f17a3'
            'd920185223f498aead09ef7a130f58d9195362ac261518fb59b16290ba5b33e3'
            '9bacecc19c24810f6e8759c71e61299164f23c366a134ea8322948a5ffeaed76'
            '280aa961b093ac1dd94c8848bfcf9cd53ae82f84b18d378b2efaddd919436a84'
            '6e89afb8b30132aa91b308045758a4793f5af3176b2823385cc66a8c2dd75774'
            '85a591b0726722a2fcff5eb0d8d27ff9775654684904be8151d91c66289e0fb9'
            'c91b97bc4414eb4440125242e6127f7e09324cca6fbcb77206b75cc68942bcd7'
            '0dab92d0544f7b233403f14b84a663bdbfa746982eda629e7f4f9ffe1b036feb'
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
