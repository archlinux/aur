# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-comme
pkgver=2.0
pkgrel=2
description='Comme is a sans-serif UI font by Vernon Adams.'
arch=(any)
license=('OFL-1.1 AND GPL-3.0-or-later WITH Font-exception-2.0')
conflicts=(ttf-comme-ibx)
provides=(ttf-comme-ibx)
_commit=995b221f952a641bb6e04b35418d461fccb38c2d
_dl_base_url="https://github.com/vernnobile/commeFont/raw/$_commit/"
source=("$_dl_base_url/CommeSans/Comme-Bold.ttf"
        "$_dl_base_url/CommeSans/Comme-ExtraBold.ttf"
        "$_dl_base_url/CommeSans/Comme-ExtraLight.ttf"
        "$_dl_base_url/CommeSans/Comme-Heavy.ttf"
        "$_dl_base_url/CommeSans/Comme-Light.ttf"
        "$_dl_base_url/CommeSans/Comme-Medium.ttf"
        "$_dl_base_url/CommeSans/Comme-Regular.ttf"
        "$_dl_base_url/CommeSans/Comme-SemiBold.ttf"
        "$_dl_base_url/CommeSans/Comme-Thin.ttf"
		"$pkgname-OFL-1.1.txt::$_dl_base_url/OFL.txt"
		"$pkgname-GPL-FE.txt::$_dl_base_url/GPL.txt")
sha512sums=('1f1b709f4bcdd56d8a38f72d7a63067d31e9812b7e4e697a893a48d81c713a0a7f331a1fac4ce6b19c6f115b145d37b0066fcd27f7aaa04e619850e93e39d2fa'
            'c643b97bb2dc8a2e24c1dd09af28a6a7e9a63e00f58f2d35481c663170e24368fc9fe6e4600764719e6890ebf16993c3d38cea98bdc9597490b07e6003cfe63d'
            'd9b8e131a2830f67a4733c2a9c733cb73d06e296b55d2111ce29584ff8c61b5fd2bd942f5789898ece93d8c45c12b4fbfb306b871a4788866a1ba5202df54db1'
            'dfa93082ec5ed31cf469dd86c514fd57c8ea5eb999c89f65a093f9ef20690189a15ddd5468618eeb29abbb3df222c0e470c531b8f8705d9faba17d536ab5a2d5'
            '2a7315ebf16cf74c2b8e31f2522815a7d7e7f3e751237e6b273da559539e6b9a6ec83c72cb8b1f57bf74b7981277e8c9d1591130505e2ba64e06191cbc30ccc1'
            '0f8e0f53a8ccdb8a5e093702869de4f57b67c2be75206df732ef6c3c33c884bc4146ffba74a811c0f1679c36d6563c366e083870ab2cfd2ac33fb8b09c13b785'
            '3db7d6fca528adda117e552992c9e6fabd7825e8beab627fcfde8dbbae11d78030b6972724c587aa3f2e5f4ac51d2f70c4ae132db1f411aba5d829abca50be09'
            '2f1bf86faa2debcc64df3c9e681a7c4986e532b0851c19bb9ee67e10b6d23dc46739b411666c1364620013868a40e20489d65a9cf1b958570a335e7722228253'
            'b1825ba935d57ba0e29157a2a017bcbb6221410e7d54fec477392c95e8f77fc9e29ca77fc0bf6318667317faf79d5902798cebb595dfb813baac66e85c3a1f5d'
            '31cec5dc3b50339bac82c66bef07ae2ff46a4896393e8cfe78d08300d25d843cbe2f50cd5df7a777227bd53d534962963cf9e01a8596b89fea01c90adfa5ccb6'
            'd0e365a145af58a199b4fa8c3d5420d4ee5c4046be749ec8fa5c5f40cb4c681142e2e32bde1fb77caa2e4cf06d425e5a23d46b5ae8f5f999ff121995a79a2fbe')

package () {
        install -m755 -d "${pkgdir}/usr/share/fonts/ttf-comme"
        install -m644 -t "${pkgdir}/usr/share/fonts/ttf-comme" "${srcdir}"/*.ttf
        install -Dm644 "${srcdir}/$pkgname-OFL-1.1.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
        install -Dm644 "${srcdir}/$pkgname-GPL-FE.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/GPL-Font-exception.txt"
}
