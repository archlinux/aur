# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-lite
pkgver=20201206
_commit=20bc5918912503bc1537a407a694738c33c048aa
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
sha256sums=('725c6264b5482ff17b26570e6e908ad5b5f0a027d9c8f35c2f47be071372649c'
            '5c97c15664b4d31b35698e27f9ef09b55a4af363dbbdb391dee5e486ebe53ed6'
            'd62ff7c27ae901ae9b5c3ef0cae4a1f091e28a7ce62b9e0fed86a38185f84971'
            '4a44bc45d89669b612d00483f01233b43caaef695f1998702126154a37093180'
            'fd0142325f12c857b3443c2390f7f4a697b5c4017fbad4cfd16218cf33c4ddba'
            'a819f22b573b8a5fea85414d9a2559f6e6704a5a33a0cc69085a2b40405fb022'
            '825b639e2a2559e97e5c61941d722f69352998706f1d828be1fc9c1c78ff9905'
            '256a9ee60e8294c5f152c17ebf4d87029241983281bfd4cdbc965b2a24f4c873'
            'fa22b9666d51c2623d199b1d34b7297a61817985a2dc86b23dd8324d3db862de'
            'dac8e68fe43fca59d522fa5f763322cfb4a919c28957656c58e7836d915307d0'
            '451ae4a0d218590080f4dadfcb2b7ff380c27a14d4c6946f9571c52bd01ca817'
            '160e355f434f795a2b82a00aa766694b8dd7665cf8a761444801a05c5fa7c35f'
            'f372812d7ce0f91ad6f65f0f75062777ee609fc42fdb871ce7809d9eda887c04'
            'c40ba0f3e59a1082daf1f59183e9638d3c554c448674df9637af0f61dd64865e'
            '6b19d7a2ba3affafd54fa47934d772d8d0f48eb92bbe733772215b5b9e76c9b5'
            '92ff55752aeba6df914c6187e0adfbbbf5d7b325f780f835b142542e2c49459f'
            '620cf514ac4c6b91ef7bac5c658c2883995f7d310963ec569b5cdd9b43e9154a'
            '3f19cd45c6ddee11185fec274c69212e461b7f95766a239bf6657c7daf88fb76'
            '152502427af65288d77449d67cb2935f3468ec9f0576849228f79ece79f074b6'
            '3934c4c5486f62d00111b7afbaaf799d537a4c5f29c050a9b322715f1717a0b0'
            'cb70f8c03df3ea688a9d3aafccf4bfa32a75adee3730505227011f98edabf59f'
            'f65406a370754bdabd9999e022179821381f9fbd45c45fd674138e8dcd652ba6'
            '1a304adf60b705e29b48463ae303fc20fc7e8d041fc68e55efa5ee49137ca8bc'
            '0dcf16eb78c666814fac36f60309b2c74ab6d306f678b98c8dfe37709808664f'
            '55ae6f20dbcf0cb85fbb6460818988c1ec1edf921eef0805d10e800dccea887d'
            'c731be97fea937135032ddd09c0c7328cc548e6d5aa737161e7e34539f169df3'
            '8adf218acf5e30c5b2c96d3eff8f2747707f4c228321854726dcd8b799c63e14'
            '978a488c634f845980ea43e22a6f57c63db819d22f3275f58b1fdd0b0938c576'
            '6d29d1ea2aa5ab53a6508bd70d44b01d5abd4b7c189d576e6460ef99b74cee5f'
            'fbd192b71b23a7aa2750469193cb7e8dbe9683021128d8456dce9c2a7085cb0d'
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
