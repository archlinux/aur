# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=llvm-cov-pretty
pkgver=0.1.4
pkgrel=3
pkgdesc="More beautiful HTML reports for llvm-cov/cargo-llvm-cov"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dnaka91/llvm-cov-pretty"
license=('AGPL3')
depends=('gcc-libs' 'cargo-llvm-cov')
makedepends=('cargo' 'git' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "https://github.com/MarkMichos/1337-Scheme/archive/ca6a329cfda8307449d405b70f8fab34b8fd23b5.tar.gz"
        "https://github.com/ArmandPhilippot/coldark-bat/archive/e44750b2a9629dd12d8ed3ad9fd50c77232170b9.tar.gz"
        "https://github.com/RainyDayMedia/DarkNeon/archive/174bd535dafffd68df7a6a8fd21312aff32600a4.tar.gz"
        "https://github.com/dracula/sublime/archive/c5de15a0ad654a2c7d8f086ae67c2c77fda07c5f.tar.gz"
        "https://github.com/AlexanderEkdahl/github-sublime-theme/archive/508740b2430c3c3a9e785fc93ee1d7c6f233af53.tar.gz"
        "https://github.com/subnut/gruvbox-tmTheme/archive/64c47250e54298b91e2cf8d401320009aba9f991.tar.gz"
        "https://github.com/crabique/Nord-plist/archive/0d655b23d6b300e691676d9b90a68d92b267f7ec.tar.gz"
        "https://github.com/sonph/onehalf/archive/75eb2e97acd74660779fed8380989ee7891eec56.tar.gz"
        "https://github.com/braver/Solarized/archive/87e01090cf5fb821a234265b3138426ae84900e7.tar.gz"
        "https://github.com/jonschlinkert/sublime-monokai-extended/archive/0ca4e75291515c4d47e2d455e598e03e0dc53745.tar.gz"
        "https://github.com/greggb/sublime-snazzy/archive/70343201f1d7539adbba3c79e2fe81c2559a0431.tar.gz"
        "https://github.com/erremauro/TwoDark/archive/b7cb2e6ce36e809e56dc09ceab46a879809b56ff.tar.gz"
        "https://github.com/vidann1/visual-studio-dark-plus/archive/01ee1e8e0dc578f3b4e8c0dbb6aa0279b4a26a40.tar.gz"
        "https://github.com/colinta/zenburn/archive/43dc527731731666d6d2b1311e86951a8ce07fec.tar.gz")
b2sums=('476bb2564bf524e3193a057008e4a9f8e2013197db43b613d71c9ee73944b8daeae6051b0224c1afaa5b18662986a20fa28f8f7ee85b32bb1d3d83f547852e84'
        'f7debc4907e0825dbb854cceb7f1a0f2ca5a5d6ef2c1280b64aaf45c4b6322e61e7fa35d728d91d6774af047ce3503921c403c3026a63852423c4b1a1d3c915c'
        'e232aa88556e11d0a74c843c7f9231a9b9f61dac4701ce6ef09e95aefc84f3fd457db472f97b936a59fc01ca76098a1b4c4ac46add5131959547c6e4ca8895a0'
        '9b76b497e44babed2ea29c8637ee79806d97aaa68725d6082f3e7199a8b553d4da16e9648a15262a75c09aeba2fa50ace99bb3a824d18cfd1970dd1757ea3773'
        'b850559a6fd4f3b60a31c842033f1ca11bd5c7b63ffcff76969dee0337f46c96b7b9c7940d34ba40403975cce6d91ce32ee1b9d46d33d9833f8eeb9c93c3ce60'
        'cb97b3d39f522c8f27999596d42d473e6434d6ade7bc967d4d43a6fab49e0b1e547c1a0b3c28da5692946ebcaff70a51e8d3853208b0598f5c1d919f16b3f1b6'
        'b6552d96f44ab4db7bce93fcf8a987400b0c66110ed71c5ec350105d21565c0fb6d2c7ca13b590448b535faf0afc559617ce7c6615f70b2cc8a686f814626219'
        '1c64624c1775c31b7e6be070e146199fa845f005c9763ef94961c26a6dc88642d34298c12558971dcf6769aac6133cc3417ad9bf4b6626bceaf90cd265c46819'
        '71ff8a6a0f6514b73b8fc92d362805a4e17bb0ef969a086ea9b35ef7ec06df160397eeaf85209384dc4a6fe501c12aaacadda6e1583526c8d5520157d2a6601e'
        '29b263c47965c01b36cca6423ff26c8b478a0bb5c0d4fac665f95f33408e58ad92e0bd89cca24f2eec635c1e884353bd31aeeb87207742152ed586b15eb2d753'
        'abb8f3661931c3dee4e4b8e2eee42902eb9addc49f7ae69f4abd28e76022059a73440519e1d9ac18752b8bc5ec767f88a928bca8ebce08b2df92c4ade1cec7d8'
        '4cfc26e6d0c016dfcc3c5683c3a4db8318c2c5cde8ad64b286591e9681307b8ad38617b6a74e4b17bf587fb090716eafbf281a2e7e93685efe9b323ac9a226f9'
        'b534b9e0644ebe35bdc408e0e0092c142ce032c8907034cc065a83c90d7b7e7f5649ad31c824ef13bc8d178f1d6c5f874b8a66e4608a3b08142c7db9127b3c66'
        '4c2e587b1e9338579ed02ecaea57e83a6589f6e838cde1dd209e907883e50935a8181b62751708651beefd30e87f4b1c32a3a90d9ae1d442b001404a99dedeb4'
        '5f31d4b8389c43f96ceb1cd33f29f5e034fecbc9182d43debe2d2e946feb5f3ce886d4897478538456612592a3d32b682ccf0b3180e190f8db6e94b3205a9924')

prepare() {
  cd "$pkgname-$pkgver"

  rm -rf assets/themes/*/
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/1337-Scheme-[0-9a-f]+$'             | head -n 1) assets/themes/1337-Scheme
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/coldark-bat-[0-9a-f]+$'             | head -n 1) assets/themes/Coldark
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/DarkNeon-[0-9a-f]+$'                | head -n 1) assets/themes/DarkNeon
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/Nord-plist-[0-9a-f]+$'              | head -n 1) assets/themes/Nord-sublime
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/Solarized-[0-9a-f]+$'               | head -n 1) assets/themes/Solarized
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/TwoDark-[0-9a-f]+$'                 | head -n 1) assets/themes/TwoDark
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/sublime-[0-9a-f]+$'                 | head -n 1) assets/themes/dracula-sublime
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/github-sublime-theme-[0-9a-f]+$'    | head -n 1) assets/themes/github-sublime-theme
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/gruvbox-tmTheme-[0-9a-f]+$'         | head -n 1) assets/themes/gruvbox
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/onehalf-[0-9a-f]+$'                 | head -n 1) assets/themes/onehalf
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/sublime-monokai-extended-[0-9a-f]+$'| head -n 1) assets/themes/sublime-monokai-extended
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/sublime-snazzy-[0-9a-f]+$'          | head -n 1) assets/themes/sublime-snazzy
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/visual-studio-dark-plus-[0-9a-f]+$' | head -n 1) assets/themes/visual-studio-dark-plus
  ln -sf $(find "$srcdir" -maxdepth 1 -type d -regex '.+\/zenburn-[0-9a-f]+$'                 | head -n 1) assets/themes/zenburn

  pnpm install
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm run build
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}/
  ./target/release/"$pkgname" completions bash > "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  ./target/release/"$pkgname" completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
  ./target/release/"$pkgname" completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/man/man1/
  ./target/release/"$pkgname" manpages "$pkgdir"/usr/share/man/man1
}
