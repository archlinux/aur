# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
pkgver=20220607
_commit=c971829a87e7920f960e7277c3dafd9bedd3c601
pkgrel=1
pkgdesc='Google Noto TTF fonts (lite version)'
arch=(any)
url='https://fonts.google.com/noto'
license=(custom:SIL)
optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
            'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
provides=(ttf-font noto-fonts)
conflicts=(noto-fonts)
_url="https://github.com/notofonts/noto-fonts/raw/${_commit}"
source=("${_url}/hinted/ttf/NotoSans/NotoSans-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
        "${_url}/hinted/ttf/NotoSansMono/NotoSansMono-"{Black,Bold,Light,Medium,Regular,Thin}.ttf
        "${_url}/hinted/ttf/NotoSerif/NotoSerif-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
        "noto-fonts-license::${_url}/LICENSE"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('2ea74ab862678045678cd0843e12fa17e100e7ad10b20f220fea6bb7b0ae88a5'
            '91758ca2da43c9d883d3baddda3c2629aede21dc51fc95f97e51b85ae7d4f6da'
            'c976e4b1b99edc88775377fcc21692ca4bfa46b6d6ca6522bfda505b28ff9d6a'
            '6edf4227ef0fa846aca70e86a307804ca4401741830f5b3af0f2554abe2b8466'
            '36cff144df01309dab648bea71baff9bb074026914afe63aeacc8bc90b67a28b'
            '74ffdd438f2ae232371ceb00444dae93e2590d263a4ff4c5e2c8385aa8012fdb'
            '701297fd68809f0834632aa93a5ec3e16e072aa6cbe153fdb0a827422ecc94da'
            '7bbe267354704c6ad18bde24b1dbc756c8e4380ca1c3f3c25c45ec5c4471510b'
            '7e6fae52e3df56ef6544c74f39a3948f7391eee44a48640e2652602455de46bf'
            'b85c38ecea8a7cfb39c24e395a4007474fa5a4fc864f6ee33309eb4948d232d5'
            '4dff742907c3816bf9c0e7ead025afc1ae8474a3315382fbf54f3217eaba3c68'
            'd36b58eaebf41ecb30f3b8d7fbfc2e556522d46ef19ed7e7b8fc3e01f1aeb5d7'
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
