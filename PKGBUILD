# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
_commit=0fa1dfabd6e3746bb7463399e2813f60d3f1b256
pkgver=20190926
pkgrel=4
pkgdesc="Google Noto TTF fonts (lite version)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
            'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
provides=(ttf-font noto-fonts)
conflicts=(noto-fonts)
_url="https://github.com/googlefonts/noto-fonts/raw/${_commit}"
source=("${_url}/hinted/NotoSans/NotoSans-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
	"${_url}/hinted/NotoSansMono/NotoSansMono-"{Black,Bold,Light,Medium,Regular,Thin}.ttf
	"${_url}/hinted/NotoSerif/NotoSerif-"{Black,BlackItalic,Bold,BoldItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,Thin,ThinItalic}.ttf
	"noto-fonts-license::${_url}/LICENSE"
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('3a75e8da3811538449fe6284dff7cc04448fd71177ab1cb98eba3fd030ebb5d2'
            '4eed0e8989f74a19954acb337da34c6e9ff8b92b2bd75c2969ba953f0d027534'
            'd00e79e314c9400eeaacb4043c2f4b0a0cd6da0b5ba5c76ee921b5d1bfa9841b'
            '2ff16a4d0c7711e0933059cbf672a29ec26a001a82395a6ebf4792aaf5c1cf5e'
            '3756b76d553b86ba5569fb8be18eac5b13cf3628310439132a1ae10334a07ee4'
            '2532e0014ee8a7623d4311914bddc74232b1349162690d28c6e40fa5120f68cd'
            '1b6bc16906ab5c9143d82b119024560f07ce4bb95d88bb6aaba021d7ceb23163'
            'dc27f8bf0adf8433909a86f6d356d52f4adf5a53105eedbd8c018390daf37ff8'
            'da9963258d3d6776c1df743610b9a64be00274b6364780b2c71cc957ba43778f'
            'd78a4640e19e06c128e2041d480d5ddfd8db4fdecb3d582ca12b26aef1548bf9'
            '8cb8a41c62502c5b938fb61043474edd5c6c063b52c26b9d171d4bf773daa52e'
            '1ae3ed5264ab1317310b0c2b50f56fee8152cc5b88839840bfbe59f83fa9dd19'
            '08bbceb701a06b9af1dd5b630e78a6a8f8a29322430e28b562c13702bd466976'
            'c106bcfd27981a932a65d9ca8e472f76b1a2ac464f65f20e99ced84943885db1'
            '0b200245e82386de5206ecf22c8ee21749fed0b3927feea52758840f788bfe5d'
            'f2f76fd00bbd411eaac375b3f325be4ccad027ba516be54ba14bc9273e05e8b5'
            '98a9cdff48b962e5599cf34691327a1066b28396f2b8305523669f4972060488'
            'bccff0ddf5b51c74171817c19ff68a0cd773a037c6a84c72111dd2233f72b017'
            'cb1c0d2846060f34ad90d8ecbcefdd01f4acf6583ea1cf8900d54144863a7243'
            '81bf211652c741d8c61ca5be24fef5ec2005ce0d3fb4b15edd7b5037b2dcd5bc'
            'bfafe9406c66e9f6db1f0d439007992b34623df252b37450a5dd7a2101e9e186'
            '7f49337dd100d66814dbeeb7ea5cbc2fe5c39cf007cc58ea97e1f2b4b16576c2'
            '7689876b455d2f1ba19083c57c56da9087fbae0f4e5877f0af037722947b5e31'
            'c0f7c29c09dc83edc2f53176f5b8e6e3ecb8c0af8b7a9fe3c8d016c419065647'
            'e0e5604cb9a244657c2db3f32513cac7b8b8bf7ddb4215f872d620a8e6709450'
            '2608392449391e3534572c38ff632f5c265a96ea06e4c067995222fcab33f9d3'
            'afa2f33b9646e6277b628e6a9d2f6410295c74d469d5cfadcffb17258329ebf7'
            '7953a35072390efc1ba0d93ba95d1c781ecdc096034f9bd8d08c12d431267488'
            '4f2df745776744487463d3d6eb366a858b9b1e6807d42a09142164341b21a9fc'
            '5bccdb17fe575034a918e90f256e86a11148ddfb16ac0250ab996a5dbda89726'
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
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/etc/fonts/conf.avail/
  install -d "$pkgdir"/etc/fonts/conf.d
  ln -rs "$pkgdir"/etc/fonts/conf.avail/* "$pkgdir"/etc/fonts/conf.d
}
