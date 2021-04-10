# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=oauth2-proxy-bin
_pkgname=${pkgname%-bin}
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=7.1.2
pkgrel=1
license=('MIT')
makedepends=(git go sed)
source=("$_pkgname::git+$_url.git#branch=$_branch")
source=("${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/malfunkt/arpfox/master/LICENSE"
        "oauth2-proxy.service::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/master/contrib/oauth2-proxy.service.example"
        "oauth2-proxy.cfg::https://github.com/oauth2-proxy/oauth2-proxy/blob/master/contrib/oauth2-proxy.cfg.example")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-arm64.tar.gz"
                "LICENSE::https://raw.githubusercontent.com/malfunkt/arpfox/master/LICENSE"
                "oauth2-proxy.service::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/master/contrib/oauth2-proxy.service.example"
        "oauth2-proxy.cfg::https://github.com/oauth2-proxy/oauth2-proxy/blob/master/contrib/oauth2-proxy.cfg.example")
source_armv6h=("${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.linux-armv6.tar.gz"
               "LICENSE::https://raw.githubusercontent.com/malfunkt/arpfox/master/LICENSE"
               "oauth2-proxy.service::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/master/contrib/oauth2-proxy.service.example"
        "oauth2-proxy.cfg::https://github.com/oauth2-proxy/oauth2-proxy/blob/master/contrib/oauth2-proxy.cfg.example")
provides=($_pkgname)
conflicts=($_pkgname)

sha256sums=('8a9c57d0b6c9dbb9b406923b8c9654c459ef85a608a44f10c998dfe0705a3379'
            'abfbab0511686490ea994857e61789e327b6e00f867d2fb8b3605746d19a8fda'
            'ccc409e1b57dfef6fcfe42a227c334e1f86fb8645587194d3d7183d0d29d50dc'
            '59b7f2f1877f3cec278be73e09dd44de0c7487d7d361d72ad25bb3e583e3a66e')
sha256sums_aarch64=('b5653a42003f4f315f85e0a4d2f5c1f3553a6f09638a55714899cac2e63d8aaa'
                    'abfbab0511686490ea994857e61789e327b6e00f867d2fb8b3605746d19a8fda'
                    'ccc409e1b57dfef6fcfe42a227c334e1f86fb8645587194d3d7183d0d29d50dc'
                    '59b7f2f1877f3cec278be73e09dd44de0c7487d7d361d72ad25bb3e583e3a66e')
sha256sums_armv6h=('101c81e621b43e32faa7745ae14950d6102698cffd4f18b1c04fd33f118566eb'
                   'abfbab0511686490ea994857e61789e327b6e00f867d2fb8b3605746d19a8fda'
                   'ccc409e1b57dfef6fcfe42a227c334e1f86fb8645587194d3d7183d0d29d50dc'
                   '59b7f2f1877f3cec278be73e09dd44de0c7487d7d361d72ad25bb3e583e3a66e')
sha512sums=('62f8bce09c18a1c5b97cfa36cf1ff14cdc53b94a11bf0116187c56120978cffd332a36a011512dc6578de91af7b8a4069e8ef412ae58fe9376f4a636db8147b8'
            'db157b11d60e40c4ad70be9a80b2cf3cf972292867eb4becbb5d027446e12eeb4ff0d87836097b4da4b16ba10a1b7b3d505f406d36f5e457d6766d34d95e5b70'
            '34f198cdc2a51c46c7689e3b34ef4c98f71ebad9feb66b8f0509d6a1f179d53d78f98d8d58fdbce2483c4d1e114f68cb13369df5957d68a84042d3fb72f025e7'
            '75bee0675f78288ad11100e4b99ed3eeaddb4addd78aba3024997b1fa3e54f1857c1562ec5610010fdadcb6b5c27c8156bb4b2da372b3148e013082f0c40f6e1')
sha512sums_aarch64=('046544e67b3566692a61045b3ff72d4047f47c335206945c7490002a771f3b4ab621f2edfe4833ec4d5fcb3f694bf97ebacac601792d562e91a686da89b614f9'
                    'db157b11d60e40c4ad70be9a80b2cf3cf972292867eb4becbb5d027446e12eeb4ff0d87836097b4da4b16ba10a1b7b3d505f406d36f5e457d6766d34d95e5b70'
                    '34f198cdc2a51c46c7689e3b34ef4c98f71ebad9feb66b8f0509d6a1f179d53d78f98d8d58fdbce2483c4d1e114f68cb13369df5957d68a84042d3fb72f025e7'
                    '75bee0675f78288ad11100e4b99ed3eeaddb4addd78aba3024997b1fa3e54f1857c1562ec5610010fdadcb6b5c27c8156bb4b2da372b3148e013082f0c40f6e1')
sha512sums_armv6h=('6ddcdef8ecc7d1e4ab8e9adbfa78deefc03533de9a3403583597d0b9b4751ffc80c70ab5d035732869e237358a16e764d1f9a1df5504b907ee6518b08f3ce695'
                   'db157b11d60e40c4ad70be9a80b2cf3cf972292867eb4becbb5d027446e12eeb4ff0d87836097b4da4b16ba10a1b7b3d505f406d36f5e457d6766d34d95e5b70'
                   '34f198cdc2a51c46c7689e3b34ef4c98f71ebad9feb66b8f0509d6a1f179d53d78f98d8d58fdbce2483c4d1e114f68cb13369df5957d68a84042d3fb72f025e7'
                   '75bee0675f78288ad11100e4b99ed3eeaddb4addd78aba3024997b1fa3e54f1857c1562ec5610010fdadcb6b5c27c8156bb4b2da372b3148e013082f0c40f6e1')
b2sums=('1616337855b990bcf1c00b74da821101e1c50e004b996e96b6cab4a7e1b7f2d3ef5f9b4892b407231d2cb8544dd8b8ee011d332c97f025d2a58e12d6c35d9911'
        '627af2ea1c83988fd234535aa8dfa265de69a3923912c734ce71919e8a2f289f41276d96e076dfe05e53e008ab7d11e4ae49e6cf7baba526a871bfc2d2355265'
        'bd4be0c408aa41601101aa023330bc8d128887c057a04eeb29ab95c45fc674e08698bbed6bd0857b2618f5f94c199cd5c1bc5451b4c783ce7d17c4524449447d'
        '3cedbae18e88acfa69f623d8e0826c3f96c5e21dae87dac68e00c4b18215d25adf0d2a314fa8a610738bfea94afd990cb55fac3bb7cb1582824a428d9ad06672')
b2sums_aarch64=('8c6c08f0b618169b3b6bf5bc39c53b426518f435ce617b86ad906ba93dedc31c017696eae3cae14f1fe12fac26e53639a32d9f37158c231f4e92c29f40b3e1f0'
                '627af2ea1c83988fd234535aa8dfa265de69a3923912c734ce71919e8a2f289f41276d96e076dfe05e53e008ab7d11e4ae49e6cf7baba526a871bfc2d2355265'
                'bd4be0c408aa41601101aa023330bc8d128887c057a04eeb29ab95c45fc674e08698bbed6bd0857b2618f5f94c199cd5c1bc5451b4c783ce7d17c4524449447d'
                '3cedbae18e88acfa69f623d8e0826c3f96c5e21dae87dac68e00c4b18215d25adf0d2a314fa8a610738bfea94afd990cb55fac3bb7cb1582824a428d9ad06672')
b2sums_armv6h=('16cb33b77a1819b0856d122ac5ee4a4d27228c15b253731aea73ad5e6f94d7fa374ac02a4b2136c8d574e8c8234531d7528189a1dd5802fce2aadd653c903575'
               '627af2ea1c83988fd234535aa8dfa265de69a3923912c734ce71919e8a2f289f41276d96e076dfe05e53e008ab7d11e4ae49e6cf7baba526a871bfc2d2355265'
               'bd4be0c408aa41601101aa023330bc8d128887c057a04eeb29ab95c45fc674e08698bbed6bd0857b2618f5f94c199cd5c1bc5451b4c783ce7d17c4524449447d'
               '3cedbae18e88acfa69f623d8e0826c3f96c5e21dae87dac68e00c4b18215d25adf0d2a314fa8a610738bfea94afd990cb55fac3bb7cb1582824a428d9ad06672')

prepare() {
  if [ -d "${_pkgname}-v${pkgver}.linux-amd64" ]; then
    mv "${_pkgname}-v${pkgver}.linux-amd64" oauth2-proxy
  elif [ -d "${_pkgname}-v${pkgver}.linux-arm64" ]; then
    mv "${_pkgname}-v${pkgver}.linux-arm64" oauth2-proxy
  else
    mv "${_pkgname}-v${pkgver}.linux-armv6" oauth2-proxy
  fi

  sed -i 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' "oauth2-proxy.service"
}

package() {
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 oauth2-proxy.cfg "$pkgdir/etc/oauth2-proxy.cfg"
  install -Dm644 oauth2-proxy.service "$pkgdir/usr/lib/systemd/system/oauth2-proxy.service"
}
