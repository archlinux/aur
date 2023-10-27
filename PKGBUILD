# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
epoch=1
pkgver=23.10.1
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
sha256sums=('4f23e3bc354b059d1faea6a5fcd372310def7989b41154d5e473f66577c17505'
            '5ff226eaf25bde962de90e77cb30a93d5878385b92a537cf98b05bfba1340844'
            'eddd07b08d9e81a17920c200d42c166eb8847f5d336c53fbd058d9740c016ad8'
            'db987383f90cb8b7c94c0d1ef452cb893a23ebd8dd1461c2dd0bef22267c99cf'
            'd42d659352b03165626ca4e0f5b523d6539f92f1cad77490e9f7b04f6d911ef7'
            'b6a5783bef74b298e74e9fff41461f67efb05acd008da5fb6fe1b1520bc79e8c'
            '34626c124286b6114d4d0bd61c6613ac3b36cd5a206d3c6b67df8a8032c156a2'
            'deacd1a2242fdd248ca7625e0fb96fb5ecea86500af20be431647d8d9bbd3388'
            'dc109e5cd0294c56120769fb1739c9e33eac5fcea9d51d0400e0016a74db122e'
            '0e90d375cdb64f088a6a676eb560b755afa184e523fefbb9c33fdda4d7dd8461'
            '5f0e86164731fb9efd575f3b69265cb7aea892d75d43f9b9f8a696090548307b'
            '78ee963c4d962723603bd1a857d0087ceef8e84d80edd16584523b5757dc5b89'
            '1d67ac294d15b5fc68a27ca94a665cdab908b07d397577cebea91a2270ad8430'
            '22be651fa535069ef66862df67f3b4d2f3ffb8800411190f2782964a104f0478'
            '39a41d68ab9f16cf57a06dfbf510515581f87282ce546c09fd824c64a95af6cd'
            '67603db1866745e6afd3ed6828e98917d0c3278824842e9c7e71ae5ff369cfb9'
            'c19525efcb2c9cc86dd7a6d85953126d904574af4776a6623d59e56be272038e'
            '2b06d33bc4646deaaf2f9d9eec4acbb1d692692b702aa6cf967f8f8c8d687770'
            '0b42abd3d2bfc668ce615fdd31446bb92974f3adeeaa62645cdc3733d2a4df5d'
            '6bebaca3e15cf27d69d9ad65b47467f43836d0527d486c84572955356766a192'
            'dc66ad95999afd20b0a2d76566550e36d74ec482687c2912747d0423b19aba5c'
            '029864500bc855870cbce7b71132edebe328c4ef7cce09b184e8f1f0e7f51c9b'
            '3a5525718a52e15672a4ecaa14cffaab485eda1bc9185eb12a8fc42b23b903ba'
            'af098b6e0df11301633fb601e64e4409cb87f915ced6a082ff50353dec9fe600'
            '6a6cfdaac9a5681b4b7e90f8b473f12021b107e3e300ef506ef220bba9286d24'
            'f0268d101d9b5846e9f70860f2feae89bf6c60690246403f0215104b3db825cd'
            'dc086174135cd3a175884698e055bee64a2894112ea3b8f91faef8fbf6ea06e5'
            '89b2fefbb4480cee049ae87282a6cf4a64c96b9ccdb7c0292407082f103d2436'
            'b9ebbdfd87e6db9c282c62d77229fb3fc8aed747aa21750c8ec07f1edf89f458'
            '1599792c74e0088d76eab170a5e198a7ccab8958f67250be5c6196cb5d12e506'
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
