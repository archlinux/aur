# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: David Strawn <isomarcte a__t gmail d__o__t c__o__m>
pkgname='metals'
pkgver='0.5.2'
pkgrel=3
epoch=
pkgdesc='Language Server For Scala'
url='https://scalameta.org/metals/'
arch=(any)
license=('Apache')
groups=()
depends=('java-environment=8' 'findutils' 'python')
makedepends=('sbt' 'sed' 'grep' 'coreutils')
checkdepends=()
optdepends=('bloop')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/scalameta/$pkgname/archive/v$pkgver.tar.gz" 'metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh' 'version-fix.patch')
noextract=()
md5sums=('f9d0117ba797306b46ab9eda19da74a3'
         '211b84fdf059d0d783962208de791b9f'
         'ad97e9262c7b22dd71b017a6402f612a'
         '000bd73ebc3ea46b23e2c418ef97f4c7'
         '83b5669127510100d6e7ab4094877a6e'
         '38c34ab96f6cf637f7be9f72b7400983'
         '96ff5b1033f281bdce3d21e1e1586508')
sha1sums=('f1b2f0da46161f0fe21afaa22599e69981e6c056'
          '371559f416fcc9f44ce402ebe9f3361a2dc10ecd'
          'b498568936dcfd03a06d7b41f76bbb7fffbc3bdf'
          '3882901e88f4a85f85d67dcda53f83c89d4563c6'
          'f2d0e8aa2744697d4dad0a7c10f835fe5814524b'
          'b2577ac4ee93e3a611558294378c185227ed8321'
          'b25c3700bcd15ecdee3b9d7a649a4a8fa87bdd9f')
sha224sums=('0624dec0fa0ae5e75f84e16c768071ca072ebde590a61631adae927d'
            '3d3989507f163f8469c0722138a6527cd7a7a03a88a7bfe24e4a0efb'
            '43d2f6b0b4b7ef539f5109b1127dcd88828f2f8ae0b9c052899af1c9'
            'a99d9457fd6cf582b349e56e5e8e9cece30e33ff6866c5969f090f5e'
            '6ffcb9ee870dd260f90e333082e90b9b30212f1f21dd3d3a0048a67e'
            'fff5cbeed72e44f9159872f59a0ca0a19fc81a8ed943500373e9108e'
            '8a9b731676215524d69b82f88986405dffc290429d4efc9b38322eef')
sha256sums=('32400e1ce88d6c44aa96ea113267a232702b7e3b58a0098a2fc99f07e8668e94'
            '3385550782d3adc620017bbc36b4a5392e36b262f3340f0b46dedae831f352cd'
            'b3579e68cee7f23f6f6a12fe0bc6396f1722434d23ce3c58e7c9fac2233cd1d3'
            'e9bbc61ec99dc0893560a12a8a0f56c9f27016895e177a164019ab9174fe94e2'
            'c2213c8d4a1a0fe5bb12d5bcde53ab04d9b0aa08ddcabd60de938a8d480e49d5'
            'fb42157046a11089fa69e0120ae83ff3bc354709e2add4644fe3fc60aa80c984'
            '5989ec04f63efd425e29ff39dcd34f72cfd0dc9887a4424311cacf146fa951ea')
sha384sums=('d75d5c43bae9cb26101782de6981699aa60b6e4d7badbaef49a83b08fac1566327daf17a1d3178e619f1546686c87995'
            '60b649309a372a998de83b63f02f1a741f87c385ca58f7bb0af8ea9f61d741415ef4aae927426ae2fd33b8826d482080'
            '762dd7c73e994b74ebeb5c975ca0b53ddf4cbf181664d465bd9c543798333dcc4939c360a4b5b8b1b162810ea363d288'
            '6bee0d21d0fcf3d8f5ee14545be63fb2bbababb0665020540daafc708939bbc539ab940cfe122b2281156bc78d401768'
            '26859b59a04e38a5e7d02e188643765d06b893385232895f5b1435fb3d4fa4d676e8d43bbc80360f9ee7a2ee01e64d2c'
            '8b9204ce4a60890eb94f0fe673504a9a10c583b9814e844da14b8d1313db7f8cf7d5f9a7b8db0bbd25fb2f9263e434b7'
            '36804b65b231e0b39a30241ff6394203a14e0de4c94ded6cf39405f028884a09f8e09cddbb4f3acbb70e3f3ae9f77dae')
sha512sums=('66f09b1b78872eeb597dae9e0b6b84e28302155797b438434602bc781ec85e423f7eaf6c30f332ebb4bea5eb1854c1594d7ae7aa14009c6a7a918a855d369ae6'
            '940f46d12b74935ae0cb8ba8fdddfe83dc1e278babcce6cc62a2a8159fb0d0d28d0a01ecc2d23ef98bc26595d5f366a9c85effcefd0b761ece232eb0ee79a484'
            'bd26818e43627c4e20aa931663b4623e45ade0930a29952d6508fa6e1302f5140afed7f57a796c12da3e9ae256ff7c0b3eb2e5075b00ceda9d2e4ddc22e89205'
            '16d01a820f1ed93ae46194d3d77187adf6fd4e9764fcf99554430e3e2f2af4cc2b6f7918f595febd3c5e6a380bbfb930bb47a3dd2ba93c60b2ca1f874f264fee'
            '722770a6c30ccf75c73ae9be19655cdff00561c62bf15b619dfa618cdd636e97aaf5a6aca1297add4e6a54274cd49e81781d98a59986526d0077a6c64855562d'
            '9f32d0ead26fad866f52209c0f6dabdaa3481bafd6121134b2fde6e95a80b5d2757c17ca6f1804b6e060b839efa9a9f7d342d48ad8d22b767e13c585e209045b'
            '0912633098517aff79fbd7a3c8c42e7d9fe69b94dff1d3c65dccf3b1288eb31f1227d4b048730a57641772285cf9510d0dd4819e2bfd9dacb71a58524dcaf871')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"

    # The build currently does not set the correct version unless
    # built from git with the environment variable CI set. See
    # https://github.com/scalameta/metals/issues/662
    patch -p1 -i ../version-fix.patch
}

build() {
    export COURSIER_CACHE="./.cache/coursier/v1"
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT
    local -r _ORG_PATH="$PATH"
    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    local -r _OPENJDK_JRE_8_PATH='/usr/lib/jvm/java-8-openjdk/jre/bin/'
    cd "$pkgname-$pkgver"

    # If openjdk-8 is install, attempt to use that to build. The build
    # requires a java 8 environment. It is possible that even if
    # openjdk8 is missing another java8 environment is setup, thus in
    # the event that we can't find the openjdk8 jre, we'll just use
    # whatever is set hoping that it is a version 8 jre.
    if [ -d "$_OPENJDK_JRE_8_PATH" ]
    then
        export PATH="$_OPENJDK_JRE_8_PATH:$PATH"
    else
        echo 'Unable to find OpenJDK8 JRE. Attempting with the default JRE, but if it is not a version 8 JRE this will probably fail.'
    fi

    # When run with some AUR helpers, in particular `yay`, for a
    # reason I do not understand `sbt` will regularly attempt to
    # resolve the Scala compiler in a local-preloaded-ivy cache
    # _only_, and not attempt to download it. However if you just run
    # it again, it then tries to download it. This does not happen
    # when run locally, for me at least, with makepkg or in a
    # systemd-nspawn with extra-x86_64-build.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile || sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile

    # Reset PATH
    export PATH="$_ORG_PATH"
}

check() {
    export COURSIER_CACHE="./.cache/coursier/v1"
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT

    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    cd "$pkgname-$pkgver"
    ## Tests on most recent release currently fail
    # sbt test
}

package() {
    export COURSIER_CACHE='./.cache/coursier/v1'
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT

    ## Constants ##
    local -r _SBT_DIR='./.sbt'
    local -r _SBT_IVY='./.ivy2'
    local -r _TARGET_DIR='/usr/share/java/metals'
    local -r _DEST_DIR="$pkgdir$_TARGET_DIR"
    local -r _BIN_DEST_DIR="$_DEST_DIR/bin"
    local -r _LIB_DEST_DIR="$_DEST_DIR/lib"
    local -r _JAR_DEST_DIR="$_DEST_DIR/jars"
    local -r _USR_BIN="$pkgdir/usr/bin"
    local -r _TEMP_FILE="$(mktemp)"
    local -r _LAUNCHER_SCRIPTS=('metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh')
    local -r _OPENJDK_JRE_8_PATH='/usr/lib/jvm/java-8-openjdk/jre/bin/'
    local -r _ORG_PATH="$PATH"

    # If openjdk-8 is install, attempt to use that to build. The build
    # requires a java 8 environment. It is possible that even if
    # openjdk8 is missing another java8 environment is setup, thus in
    # the event that we can't find the openjdk8 jre, we'll just use
    # whatever is set hoping that it is a version 8 jre.
    if [ -d "$_OPENJDK_JRE_8_PATH" ]
    then
        export PATH="$_OPENJDK_JRE_8_PATH:$PATH"
    else
        echo 'Unable to find OpenJDK8 JRE. Attempting with the default JRE, but if it is not a version 8 JRE this will probably fail.'
    fi

    ## Change Into Correct Directory ##
    pushd "$pkgname-$pkgver"

    ## Create lib And bin Directories ##
    install -d "$_LIB_DEST_DIR"
    install -d "$_BIN_DEST_DIR"

    ## Install Class Files And Jars ##

    ### Determine Dependencies ###

    # If you're reading this and you know of a better way to get all
    # the dependencies from SBT directly, please let me know.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" compile 'show metals/dependencyClasspath' 2>/dev/null | grep Attributed | sed 's/^[^\*]\+\* Attributed(\([^)]\+\).*/\1/g' > "$_TEMP_FILE"
    while read dep
    do
        local _SANATIZED_DEP="${dep##*${pkgname}-$pkgver/}"
        # Sort out directories from modules from third-party jars.
        if [ -d "$_SANATIZED_DEP" ]
        then
            pushd "$_SANATIZED_DEP"
            cp -r ./* "$_LIB_DEST_DIR/"
            popd
        else
            if [ ! -e "$_JAR_DEST_DIR" ]
            then
               install -d "$_JAR_DEST_DIR"
            fi
            local _JAR_PATH="${dep##*/maven2}"

            install -D "$_SANATIZED_DEP" "$_JAR_DEST_DIR$_JAR_PATH"
        fi
    done<"$_TEMP_FILE"

    ## Install Metals Class Files ##

    install -d "$_DEST_DIR/metals"
    pushd 'metals/target/scala-2.12/classes'
    cp -r ./*  "$_DEST_DIR/metals/"
    popd

    ## Install And Symlink Launcher Scripts ##
    for launcher in "${_LAUNCHER_SCRIPTS[@]}"
    do
        local _LINK_NAME="${launcher##*/}"
        _LINK_NAME="${launcher%%.*}"
        if [ ! -e "$_USR_BIN" ]
        then
            install -d "$_USR_BIN"
        fi
        install -m 755 "../$launcher" "$_BIN_DEST_DIR"
        ln -s "$_TARGET_DIR/bin/$launcher" "$_USR_BIN/$_LINK_NAME"
    done

    ## Ensure Correct Permissions ##

    chown root:root -R "$_DEST_DIR"
    chmod u=rwX -R "$_DEST_DIR"
    chmod u=rwX -R "$_BIN_DEST_DIR"
    chmod og=rX -R "$_DEST_DIR"

    ## Cleanup ##
    rm "$_TEMP_FILE"
    popd
    # Reset PATH
    export PATH="$_ORG_PATH"
}
