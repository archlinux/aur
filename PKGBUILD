# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="bork"
_commit_rel="97e563f4203064d15e627538901659fc4bbdfa8b" # 0.4.0
_commit="ae7c7a82fc717d31dd9240300e5ca84f069dc453" # r167
pkgver="0.4.0+r167+g${_commit::7}"
pkgrel=1
pkgdesc="TUI chat client tailored for livecoding on Twitch"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/kristoff-it/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  "zig${_zig}-bin"
)
_zigdepends=(
  # zine
  "libvaxis-0c2b8046e4f657710ef02b77e070c116852b3a2c.tar.gz::https://github.com/rockorager/libvaxis/archive/0c2b8046e4f657710ef02b77e070c116852b3a2c.tar.gz"
  "zeit-175cf91a641790799e9d676878a9fe814aaed134.tar.gz::https://github.com/rockorager/zeit/archive/175cf91a641790799e9d676878a9fe814aaed134.tar.gz"
  # "ziggy-8a29017169f43dc2c3526817e98142eb9a335087.tar.gz::https://github.com/kristoff-it/ziggy/archive/8a29017169f43dc2c3526817e98142eb9a335087.tar.gz"
  "ziggy-eeb21acc0a369dca503167fe963f4f5a7eda2659.tar.gz::https://github.com/kristoff-it/ziggy/archive/eeb21acc0a369dca503167fe963f4f5a7eda2659.tar.gz"
  "zig-clap-a4e784da8399c51d5eeb5783e6a485b960d5c1f9.tar.gz::https://github.com/Hejsil/zig-clap/archive/a4e784da8399c51d5eeb5783e6a485b960d5c1f9.tar.gz"
  "websocket.zig-4e8fb28b680d22e633541e810e8e6190e7748651.tar.gz::https://github.com/karlseguin/websocket.zig/archive/4e8fb28b680d22e633541e810e8e6190e7748651.tar.gz"
  "zg-7ca90b6f8796cd6615ddc61e12cd292ea26662ce.tar.gz::https://codeberg.org/utkarshmalik/zg/archive/7ca90b6f8796cd6615ddc61e12cd292ea26662ce.tar.gz"
  "websocket.zig-69ac58551be9ff5f41689198bb57e29f8436cf39.tar.gz::https://github.com/karlseguin/websocket.zig/archive/69ac58551be9ff5f41689198bb57e29f8436cf39.tar.gz"
  "known-folders-aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz::https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz"

  # libvaxis
  "zigimg-0ce4eca3560d5553b13263d6b6bb72e146dd43d0.tar.gz::https://github.com/TUSF/zigimg/archive/0ce4eca3560d5553b13263d6b6bb72e146dd43d0.tar.gz"
  "zg-4a002763419a34d61dcbb1f415821b83b9bf8ddc.tar.gz::https://codeberg.org/atman/zg/archive/4a002763419a34d61dcbb1f415821b83b9bf8ddc.tar.gz"
  # ziggy
  # "zig-lsp-kit-87ff3d537a0c852442e180137d9557711963802c.tar.gz::https://github.com/kristoff-it/zig-lsp-kit/archive/87ff3d537a0c852442e180137d9557711963802c.tar.gz"
  "zig-lsp-kit-46e2b958c02dc4ed2d4784f8841ba7d2076da783.tar.gz::https://github.com/kristoff-it/zig-lsp-kit/archive/46e2b958c02dc4ed2d4784f8841ba7d2076da783.tar.gz"
  "zig-yaml-27f63d3d2d13ed228d8fc077635205e6c2a405c7.tar.gz::https://github.com/kubkon/zig-yaml/archive/27f63d3d2d13ed228d8fc077635205e6c2a405c7.tar.gz"

  # zig-lsp-kit
  "diffz-a20dd1f11b10819a6f570f98b42e1c91e3704357.tar.gz::https://github.com/ziglibs/diffz/archive/a20dd1f11b10819a6f570f98b42e1c91e3704357.tar.gz"
  "zig-lsp-codegen-063a98c13a2293d8654086140813bdd1de6501bc.tar.gz::https://github.com/zigtools/zig-lsp-codegen/archive/063a98c13a2293d8654086140813bdd1de6501bc.tar.gz"
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
  "${pkgname}_zig0.14_hash.patch"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
b2sums=('b25e2fba38eb0aae66d72e0f49f00f18e25a4af0386cd53521fa83b6839ffb63006e5663a8c8a3c599bb936741a765e557fe6771fe5019a03e75e2419a3550bd'
        '73eb83fe3d47ce3869157ca85eb6d9f589c3559610ca5df8c3c5c386ee91fb8733fdc4cff54c5d21e1521c1cafc294ec5cc009e47e9718b0741abf1a01851641'
        '80bc4c2c72e20b22f28489e6d151abb4176693ba29126abc7e2c4a3737eb0c78a4dcf8cf0de0fb9c5927cc97caf1d11616526a0fb42153a14819c22e4e74c8b6'
        '3344b365733544258e6baaeb2ee943c01d99e21f449bf227e0f95e462a42bd5667033b013e748c2e157ad0a0cbd72e1f5c63dd535c9064a48413b237a6f9afac'
        'f39eac1cd9b934859c43234b289c0ab4c4d7e45692c0be6f18b38178c96ad330291448408a20fdd0337bf5f49416500603df79201d34995481855dcef27dbed6'
        'aca0264d78549b9ddeaa4e63e06a88eef72292006c91215d938cc3f568540405374ff28bf31a20a0da065678d013365bac7df3b398b766238513dbb50b489c6b'
        'b7e230f49e4b86701b962707026395c4514cbb72075eec0dc7f4da0fa51d5ebdf86e8cad7b6309b599a53987cf0fda38ff5088720f2971d50f1c12b2c343b4aa'
        '85c8bc2132fdc18e0fdffcdf1f73850fd8d23a942ad2ac49abef60d5db7e029fdc58954b1d934d7cfc1d6de81f87edc2e05fc207e31eddf8d650691c96c7fac4'
        '5f7ed64c98dee13887d11077e4039d850dd313e4206500a0f9d261557ffa569e5f792316703e63ef538be65e4b24d505f61d355f303a18d24cad3ae58b69c54a'
        'c2d8a5062b1baf2868b4b6f58df9d065638a551c60bc7217a14e8395009a231603d2b2a8112fad7198ede43934f523c2b25654a54f89a088eabf72d23bd9b48d'
        '3fae7fbe483f959b84cf74e0f501aad0e6dda1747ccd465b2344be159b5242a7ccd76146c92de9a9518a8f07aea71ab0126c2b5edcc2145be323a2b2c18d5f70'
        '01e2243999b4b7e95a77a5339561b46bdec144611360aacc910617984281891f1a3378aece617947f1e703bbb42e1e5c3da7dbbff6b3a9847064b04bfae53a56'
        '5f2d84d7f50c4bd7cdd6856f39482379002bcc4117696dca095a2804fc8e458758ba838bacc41c1b2517010492058643a3e016f4ad7e2fc018f45aa098145f88'
        'f53f2766fa1c959e0ccac5dff26160937d916cf426dd21001038db15bf6cbad88a00f17ed9c8acd11c2062e4043972ab551fb3a541d6384d7c030179a3f275a4'
        '6f451172fd524e3cf051b228972f2ad3ab61e8391a2eb4304942d57792c3a38721e9dc7cece411f9c7005967874bd271ff434ffd1096f99b65a855884f7e34b7'
        '938e81737e9729bf64cde631cad808b77a0e2b6724d7517dd93475898011d7287d78c536a34600f1e18a57c4121c53f6123a53a08995987ab755ee67d0a12e01')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_zig0.14_hash.patch"

  cd "${srcdir}"
  for _zigdepend in "${_zigdepends[@]}"; do
    "zig${_zig}" fetch --global-cache-dir ./zig-global-cache "${_zigdepend%%::*}"
  done
}

build() {
  cd "${srcdir}"
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${_pkgsrc}"
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
