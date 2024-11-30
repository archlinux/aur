# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
epoch=1
pkgver=2024.11.01
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
sha256sums=('b380e5fd98ee6e04a6b15dc7dfa53f6683187d972b7bd270ae26a02f82f11fef'
            'fb5c68f089e17acd3c74b1c67f5c8acf5ac0aa6a9d9d9aed8690eb9a6eba461e'
            'ea2d55a642aaed2e6e3e892771e2ac16368d297bd0f008308e8a87163d913ff2'
            'e7a4e99f40f491c414724200f6dba57a528c209cb431a87be77d328e5833e01b'
            'd0999c5335ba440dfa5ec4b04e53220ab2ac5f5536ee57e2196af7f1753e6a8c'
            'd2f4da2f37566bfa79fc7a02a4f91aa8a3c1f7397437d5a9f6f2245203e70e2a'
            '857c964d6ac189135bfbd11f49efc4f85afc257caa8874875cb608f77a9c472f'
            '370c2c3597e33cc630b41e2e42e2a52fe8dc6c902bb23e0486a460fd2d6b0b72'
            'ea64dd74da3665669950c28e652e43e9371c9f382be20e1fd3b0c0cd2d9a15ea'
            'd13f29b34b17bc8d1c24c463d9b5bcac0e7818451d8eef411df4ad635a4aaa96'
            'f63cc3bfc01202ed234af70d693266084ee06f15956bd3c58c94a0807456386c'
            'ec1ddca5514000901161c22f413e8bb8a48bfe98207a2e3d8f2ba2a66c61e42b'
            'f2a28df76a1ff7d43648d2625c895468ba3ca2910e0c3ce133361225c0064cb5'
            'a21ea0ba6ea49fda7b34ca39a504b487f1130885d36e1a4f9f4255b3ba6994bc'
            '9c9dc46df01c3acee14690fc1be60f6c863675b5ac9ee190f304656dbb9ba9aa'
            '53e262499b3e6b4e7274dcc4840e9374c8d9c4a4fad48227a38d8cedd2e34c40'
            '65b5e2b2c4a1fba9ae8be1f026cb35b03dcb8886d9b2a4147054fde12f7e767d'
            '7c430e89bd442c5d02f947ca190fc78cb54136fc3f32eca9a7a3c492820e7074'
            '008799ec50249f5e1d1656561b0b99d7f5d98b2081a5604bd26334eef2b9be5b'
            '9295370d70f9374ae3261b4dcea3a905a3007285d77486e7eb21180893b47c91'
            'baf359a59a08edf1db112994b523e5c50c5d80c72bd7619cb027991311341dbb'
            '6db7550540526a9a18125b8152f354c6f6ea51e7de7055cb182eb5f12c77c3e6'
            '59c90f6faebcd59ace700c32ba7eb75899e21db6bb16320989cd25e0ca8e6ce5'
            '8421dfdcaab8270f414c011b249590c8aed94bf0df4180865a8603fc56a41892'
            'fbb31f8e0710a2ac4418e75cdaeac38cfdcd1820550fb1be0de79af1a9cc1b81'
            '99acd16b98a2f48e9ad30497efed3ba9cd4a669dd356c94938d47922b66e6ccf'
            '03b660c6bbaf30a7ad0f7b6e5848c9dee00c41099ed4d5f0b725d42bf57adefa'
            '1d827280482b0c38dc220acaa80d3f377bda185c81252bf3039f073488bc6ecb'
            'f67b25bc6699a18fd2ad3844f4ec15678a5dca11b7e37de75c5de6d09236a1eb'
            '0247f7a9935c72224305ec676a80330b621d66903411f7ee716e164a8cf6ba7a'
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
