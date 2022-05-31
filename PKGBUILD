# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
pkgver=20220502
_commit=c5481f3a1b57d54190a4e7881103033fbbbcec0c
pkgrel=1
pkgdesc='Google Noto TTF fonts (lite version)'
arch=(any)
url='https://www.google.com/get/noto/'
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
sha256sums=('a03bf1c41a16a0989a5bcd6bb76b15720653622787b81bd11e460bb848cbab7e'
            'dc8c17d8a749542a496c1c23733583a802a8959f71feb48305e9fb58e6fbd7a2'
            '0f3f608baf8d88480f399747871b374144eaf9e6f8880d2cb19cfca3ac256697'
            'eb9a9bad5cf7a88cc306573ba9e2239b95443e285cc84f5f02c38848c1b06f91'
            '7bd35300bb8a6f6aa2f4314a0202c7fe2cb9d5078a903339b8b8340a78f3c312'
            'f4ed61228d5c49981ef9b2ef88d2eb69046529e1a5a381a9fa7c705b1fb33433'
            'c1f52c7492de60333d9867ed70bf5f75e9b752412644e391f7224bdfc62276dc'
            'eb7abaf945b97ce8c187287d5d9672d70a427614f86bb0e48e1801e24f5a5f22'
            '74313efaf679694d4fb1f05a076f859e67134fded187b1faa525913fd8458af7'
            '3c8397ec9650d0ef85bd07fc2099da91fa964ebb29dbe39a38b946177ef79d9b'
            '2694960bdf7d2c0a44f9fbce3e9d535c0779c9e1970cf181008a25252dc39fe7'
            '296534ad4ac47e4ed000c586a40c9b1cda8ec52062f873058c76eb555e86de65'
            'e599306da8f33a6877d0a9813c4a75350f43bcd97363eb6bb75484f1be14168c'
            'beb857bd799a114de7d5d90cc75cc69f4b6ee8d401f4ab20697e6f9719a66dfc'
            '39f8b3344468adc1d7b9b18645a5a3931d1e061a699b8086932bb565c253c191'
            'b1e09ba9f3607d81aedc9e4e1cbe225a0df85c77bde267931a1ab28577840edd'
            'd9e2b23d19f8230be7146f409a52b1d23117e635e28f2e2892cf91b7382f325b'
            '0c83f9a06ebe5dba0c7da07422bafb520721b6b5e8141912c982458ebb585422'
            'acac62af2bdf1d910f53722b074b12eabc7d49280b4779288bffda365bb0b632'
            'cfe07948bb7feb196582e85f1ea21610fefd7f351c0cd6a5164c8b0c875823ca'
            '3b2086a869bcded2aeb4416fc281ceec9d6ce3c06756cda19f8f763636204e7d'
            '4fb8737145b4a503d548af4b517afdfc532e44a96ac15378257e825741334eec'
            '0ea81d6b54fc8aa5dff0fd6ebe7cfa431e9e6cf747a8d4aa33581fa0aaccffea'
            '7c94d858283a1d58917eac88ad8a277c831f5ef88b2db48df2268e907ebb4b17'
            '912196050a6532aa1ec385211f5fb7dd515324874a42e95f035ddd5896613044'
            '90eeb03ad7b03e67037091c061c13b12dba7d21e63f54d19d196f181c5958f86'
            'a45b7e6cfa740f00694bd4ec6da14470a742e8c3843c663ad1282900be63a647'
            'c8f669ceb2c9c60ccf55198b305e08a997ffca79a38cc7eeb551e643cbe66505'
            '618b857291d8607ef94ad22bbaf4c67e98078d01d3f1a1049d8ed597c9818a82'
            '6cf1bb2d1e87e5387c10ff3ae00f141289fffd07c567dac2c5b2a2f69baffe4e'
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
