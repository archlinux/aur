# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: David Strawn <isomarcte a__t gmail d__o__t c__o__m>
pkgname='metals'
pkgver='0.9.2'
pkgrel=2
epoch=
pkgdesc='Language Server For Scala'
url='https://scalameta.org/metals/'
arch=(any)
license=('Apache')
groups=()
depends=('java-environment<=11' 'findutils' 'python')
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
source=("https://github.com/scalameta/$pkgname/archive/v$pkgver.tar.gz" 'metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh' 'version-fix.patch' 'JREMajorVersion.java')
noextract=()
md5sums=('49b8d708b5aa1953e4e390c221d78d9e'
         '2b4f3f9f77eb5af4107f9539923483ff'
         'ad97e9262c7b22dd71b017a6402f612a'
         '000bd73ebc3ea46b23e2c418ef97f4c7'
         '83b5669127510100d6e7ab4094877a6e'
         '38c34ab96f6cf637f7be9f72b7400983'
         'f54178fcdd2f9db6e91448a23ef7858f'
         '778c5748f51da0f0d39d5e19970249eb')
sha1sums=('12ad55313e3c057609d9d73e93a93fe9c6847f19'
          'd4127d36d9b1d7ab07650f59d84c536c7a86d349'
          'b498568936dcfd03a06d7b41f76bbb7fffbc3bdf'
          '3882901e88f4a85f85d67dcda53f83c89d4563c6'
          'f2d0e8aa2744697d4dad0a7c10f835fe5814524b'
          'b2577ac4ee93e3a611558294378c185227ed8321'
          '02c69e5a416d42d4285f8cff6a14dc41d1d84309'
          'dc64de951379d01d2d1d211ceab71fc9398cc199')
sha224sums=('55ae9ae725cc5de6d1c05f3e9bb862979284e24ab550303a41222c0f'
            '0ed6eb578a9c2e8826b9a1236b22458b1bbc538affc1c580741ac506'
            '43d2f6b0b4b7ef539f5109b1127dcd88828f2f8ae0b9c052899af1c9'
            'a99d9457fd6cf582b349e56e5e8e9cece30e33ff6866c5969f090f5e'
            '6ffcb9ee870dd260f90e333082e90b9b30212f1f21dd3d3a0048a67e'
            'fff5cbeed72e44f9159872f59a0ca0a19fc81a8ed943500373e9108e'
            'e9fd63c153c4972ebc383a5519a45c468c4472b59fe878ae806c9787'
            '3a449ae946a8b4e91203037d980160b8d1798bbd08f21bb88b626c09')
sha256sums=('234c86ea7395e81c4456e62c045b5f1b46e88b289be6e7b6f2c34c39dc1a8624'
            '9948e63e7c3db57838784df44e53478ca7704150bb7bac6179fedba0377a5acf'
            'b3579e68cee7f23f6f6a12fe0bc6396f1722434d23ce3c58e7c9fac2233cd1d3'
            'e9bbc61ec99dc0893560a12a8a0f56c9f27016895e177a164019ab9174fe94e2'
            'c2213c8d4a1a0fe5bb12d5bcde53ab04d9b0aa08ddcabd60de938a8d480e49d5'
            'fb42157046a11089fa69e0120ae83ff3bc354709e2add4644fe3fc60aa80c984'
            '5c751d1d59cae8cfd0f2476c09c5ed634335203fd69bf29519b3d9fc7c2f5500'
            'c73c831ba67e2b80df65f08a00b264af8e150d48a1e321b9cfb68081a9eae6b5')
sha384sums=('4ce4f01d9b7b8021aec111e7e27d42da1a46b98fad085ff550aa21c08f56d90b9a9bc4c2020f0dbffd2e2d718dc37e6e'
            '5c1c4d43b4eb0c936412c75e969529c39553d9007ab5e4b21ed42be55ec5965cf8f2ea2aff3122e2da5e288e7f33ea15'
            '762dd7c73e994b74ebeb5c975ca0b53ddf4cbf181664d465bd9c543798333dcc4939c360a4b5b8b1b162810ea363d288'
            '6bee0d21d0fcf3d8f5ee14545be63fb2bbababb0665020540daafc708939bbc539ab940cfe122b2281156bc78d401768'
            '26859b59a04e38a5e7d02e188643765d06b893385232895f5b1435fb3d4fa4d676e8d43bbc80360f9ee7a2ee01e64d2c'
            '8b9204ce4a60890eb94f0fe673504a9a10c583b9814e844da14b8d1313db7f8cf7d5f9a7b8db0bbd25fb2f9263e434b7'
            '147642eab7c12d1f068efebc3837ef00f3faf9de58587a0a7879530d70e13fb27ce54e13a441314ffb330cea3a1003b3'
            '9f20595ff54ffaee74e6d1d6045cadca7df2326c8d451dc7d96925870820cf24108afdc7bb6e3bfad3f28d1d45d3d0ba')
sha512sums=('863e4e8270500260a7d1d41d98a70b078162103ae92595fee30d869f9bfa8c418b9a4a01f72bbae8d4a2aa571b5c3a0115ce0044b65aac4855b9576761c23cf7'
            '70a676c8a40e8da741def75cd8b03424d20d9a9b46fae397e3eab5ecf73deac348c641803f019eb9c380f30f6eea2003a26a6bc773f332e4f8cd89019ac37c89'
            'bd26818e43627c4e20aa931663b4623e45ade0930a29952d6508fa6e1302f5140afed7f57a796c12da3e9ae256ff7c0b3eb2e5075b00ceda9d2e4ddc22e89205'
            '16d01a820f1ed93ae46194d3d77187adf6fd4e9764fcf99554430e3e2f2af4cc2b6f7918f595febd3c5e6a380bbfb930bb47a3dd2ba93c60b2ca1f874f264fee'
            '722770a6c30ccf75c73ae9be19655cdff00561c62bf15b619dfa618cdd636e97aaf5a6aca1297add4e6a54274cd49e81781d98a59986526d0077a6c64855562d'
            '9f32d0ead26fad866f52209c0f6dabdaa3481bafd6121134b2fde6e95a80b5d2757c17ca6f1804b6e060b839efa9a9f7d342d48ad8d22b767e13c585e209045b'
            'dd7493bd3b4adff273b8641c590aa4b5ebddea0720d92a02bceae702483ea1629b4c963ee64bb0bca5b5ef55471a9747b35a25f9993b816c682bddb9594d937c'
            '4daebe1e0681d9981e4538d79136f7ef02c0b7fb53eaadc64f9b4fce5a4b0a5074752d56e6cc0ed0558f8e389194629aeaaf368685d01c1d63dcee669a67df4c')
validpgpkeys=()
install=metals.install

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
    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} -Dsbt.supershell=false"

    local -r _ORG_PATH="$PATH"
    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    local -r -a _JAVA_ARCH_PACKAGE_PATHS=('/usr/lib/jvm/java-11-openjdk/bin'
                                          '/usr/lib/jvm/java-10-openjdk/bin'
                                          '/usr/lib/jvm/java-8-openjdk/jre/bin'
                                         )
    local -r _LEN="${#_JAVA_ARCH_PACKAGE_PATHS[@]}"

    cd "$pkgname-$pkgver"
    # Build JREMajorVersion.java
    cp ../JREMajorVersion.java ./
    javac -source 7 -target 7 -Xlint -Xlint:-options JREMajorVersion.java

    # Attempt to build with a JDK supported by metals
    local _INDEX=0
    while [ $_INDEX -lt "$_LEN" ]
    do
        local _PACKAGE_PATH="${_JAVA_ARCH_PACKAGE_PATHS[$_INDEX]}"
        if [ -d "$_PACKAGE_PATH" ]
        then
            export PATH="$_PACKAGE_PATH:$PATH"
            break
        else
            _INDEX=$((_INDEX + 1))
            continue
        fi
    done

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
    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} -Dsbt.supershell=false"

    ## Constants ##
    local -r _SBT_DIR='./.sbt'
    local -r _SBT_IVY='./.ivy2'
    local -r _TARGET_DIR='/usr/share/java/metals'
    local -r _DEST_DIR="$pkgdir$_TARGET_DIR"
    local -r _BIN_DEST_DIR="$_DEST_DIR/bin"
    local -r _LIB_DEST_DIR="$_DEST_DIR/lib"
    local -r _JAR_DEST_DIR="$_DEST_DIR/jars"
    local -r _UTIL_DEST_DIR="$_DEST_DIR/util"
    local -r _USR_BIN="$pkgdir/usr/bin"
    local -r _TEMP_FILE="$(mktemp)"
    local -r _LAUNCHER_SCRIPTS=('metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh')
    local -r _ORG_PATH="$PATH"
    local -r -a _JAVA_ARCH_PACKAGE_PATHS=('/usr/lib/jvm/java-11-openjdk/bin'
                                          '/usr/lib/jvm/java-10-openjdk/bin'
                                          '/usr/lib/jvm/java-8-openjdk/jre/bin'
                                         )

    local -r _LEN="${#_JAVA_ARCH_PACKAGE_PATHS[@]}"

    # Attempt to build with a JDK supported by metals
    local _INDEX=0
    while [ $_INDEX -lt "$_LEN" ]
    do
        local _PACKAGE_PATH="${_JAVA_ARCH_PACKAGE_PATHS[$_INDEX]}"
        if [ -d "$_PACKAGE_PATH" ]
        then
            export PATH="$_PACKAGE_PATH:$PATH"
            break
        else
            _INDEX=$((_INDEX + 1))
            continue
        fi
    done

    ## Change Into Correct Directory ##
    pushd "$pkgname-$pkgver"

    ## Create lib, bin and util Directories ##
    install -d "$_LIB_DEST_DIR"
    install -d "$_BIN_DEST_DIR"
    install -d "$_UTIL_DEST_DIR"

    # Install JREMajorVersion.class
    install -o root -g root -m 644 "./JREMajorVersion.class" "$_UTIL_DEST_DIR"

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
