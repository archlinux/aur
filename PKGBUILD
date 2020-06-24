# Maintainer: Dmitry <dmitry@ykkz.de>

pkgname=ttf-exo-2
pkgver=1.100
pkgrel=1
pkgdesc='Exo 2 is a complete redrawing of Exo, a contemporary geometric sans serif typeface that tries to convey a technological/futuristic feeling while keeping an elegant design.'
arch=('any')
url='https://fonts.google.com/specimen/Exo+2'
license=('Open Font License')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')

_commit='0e2d90b53d2b2a6be575eb513672051262901992'
_raw="https://github.com/NDISCOVER/Exo-2.0/raw/${_commit}/fonts"

source=(
        "${_raw}/Exo2-Black.ttf"
        "${_raw}/Exo2-BlackItalic.ttf"
        "${_raw}/Exo2-Bold.ttf"
        "${_raw}/Exo2-BoldItalic.ttf"
        "${_raw}/Exo2-ExtraBold.ttf"
        "${_raw}/Exo2-ExtraBoldItalic.ttf"
        "${_raw}/Exo2-ExtraLight.ttf"
        "${_raw}/Exo2-ExtraLightItalic.ttf"
        "${_raw}/Exo2-Italic.ttf"
        "${_raw}/Exo2-Light.ttf"
        "${_raw}/Exo2-LightItalic.ttf"
        "${_raw}/Exo2-Medium.ttf"
        "${_raw}/Exo2-MediumItalic.ttf"
        "${_raw}/Exo2-Regular.ttf"
        "${_raw}/Exo2-SemiBold.ttf"
        "${_raw}/Exo2-SemiBoldItalic.ttf"
        "${_raw}/Exo2-Thin.ttf"
        "${_raw}/Exo2-ThinItalic.ttf"
       )

sha512sums=('b129a2133e82530ef640900e98fc47cd6ce17113b8615b256cf1051a0714c360628bcb0527435a310627e08e5caaafd0b1ec976720cbd669a691fc849d38c8a3'
            '2709a6f3f0b485ee3349c27a68af345c0de8dbcde92930a7f240ca155b155cab4fe04b36a3721f995ca2be27ac94efcb02fb203421de4377635385d9db81045c'
            '60ae7d33bf2bdf993f79cf7e3f5273ec71d4ae03c23434c1df410df34ecb5dceceeb6c2f9ab01719cbb864a3c1682fefde134da2e66af4138d994a3284ab4479'
            'd86643dceadf19c3d7d95487aa4b424893357ca9291a68f1f70cb9b63be8844a955973ea5352f1630b00e331ffe48f6941f9b1d47bf2bfc5b45c0033b8aedafd'
            '8c173ad66d850ec729cbfb62d17628876594077213c44e54dad9978400ae1dff7dcc0b023db3272a2b99f3ee8cea1c7d676c7c0410c075d2dce31a54b451e7d8'
            '12d7f06acbf7f89ccbb92db64e563938802c968f46ef02e1c71d405f61495e75c6b56bf466e6079eaf79926dc9eade3867e81f8507d4dc6ac2220d4395a3dbe3'
            'cb67921f0db6c1941f19a4d8e3d3018215c121e84e43f1332ba430739e4e5d2ee1258468b5df9037186eed850440d3d38b802990fcb79c3bf6f9a3e42c2b4454'
            '4e2266351d85c8f5b569a28c8fa4adbc2bb491e8e53ca1448f01b9ffc6ed1d094e5db6148e5930ab9c249790567a445a6a604a5def9a2587368d25c441265718'
            '1cd6e8da6dd2efe101c1bac53d67bb0d0e3be17a7ee840f224f754d02b4d6eb3dafd251fc0aa1e8d2ca848e6a7798e7adc1500d7dad74e442dc7897708a030f0'
            'f81d3cc900033562356f64d7bcec71c899bf15a429dff622e304d281a8c048354b8faea975e91edff5852a141a461224b8aa56e98d63ad33973c420df0ba15cc'
            '5f5286c855147f4143eaf3f33d5977789602c0c96517963300a094b2aa7508c2278ca8895d4a5b495157fe24d2afbcdf8cde4a76f6b17e970cf96f0614db317b'
            '1923c4205df5dbb2d4470bd49baa38aba746028298315dd562c00e9a37681c74cbdb32203823a586dbc18e44625f488ce98d920af7fc01a9150ecaeabd08d8de'
            '7b8d427c87b7bc82b797a56f6649b8e15e6253265b1a22b9e7c34f814df25b48a43e703b04aabb9d73159fa98bf94277fe35559baff77fbbc35a02812043e23a'
            'd2a37a4f06398f57c2a5b1cc86afd5bcffde286ff4c85c2e52534f1325db13f6be75d4480b3a1baab7fb183c458f13d55513cfb7d97fb66f843fb347a7224848'
            '6e8b235ef2c62c36e5849cd3c6059b6e8d4f990b146a811adc202cc68b58b0632285a87f35eabcea24fe964843c2dd1a1cd7d7533bfec752ff039c8c269b2d3c'
            'e06787a437187de7d3e35cb89b9e84981eaadaa5796674c2e385c7575e94761ed09153753a56ec0afdf84b4bcf776ef977a7aab86f223df3c56c8dbd6ed5bb79'
            'd394ad43ccd97f9cc65edac1af2c478ca9cf6b212c05d2e3bde647b5edcd24ea7bc214da6189ddb8338292ec11aff1c306b0d2933eee7f44fe3abaaf0715755f'
            '615f53616cf225a2a574fee11d03fbf76df108c2132b061ba9a083358a393f8a700954f9f863f5dbbfc67a1b2ad2b6f7ab6a62eb19d9840e607e5bc278e2ef3e')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
