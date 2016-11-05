# Maintainer: Nicola Squartini <tensor5@gmail.com>
#             Brenton Horne <brentonhorne77 at gmail dot com>
_gh_url="https://github.com"
_atom_url="${_gh_url}/atom"
_fus_url="${_gh_url}/fusion809"
_lee_url="${_gh_url}/lee-dohm"
_mur_url="${_gh_url}/Murriouz"
_lint_url="${_gh_url}/AtomLinter"
_language_patch2_url="${_fus_url}/language-patch2"
_ELECTRON_VERSION=$(</usr/lib/electron/version)
export _ELECTRON_VERSION=${_ELECTRON_VERSION#v}

pkgname=atom-bleeding
_pkgname=atom
_apmver=1.14.0
_atomver=1.11.2
pkgver=1.11.2.a1.14.0.d0.8.9.e1.4.4.f0.12.0.la0.9.2.lu0.39.0.m0.159.1.o1.2.1.sc0.68.5.sv0.244.0.t0.103.0.tf2.4.2.tv0.211.0
pkgrel=1
pkgdesc='A hackable text editor for the 21st Century built using web technologies on the Electron framework. Built with the latest versions of all bundled packages.'
arch=('i686' 'x86_64')
url="${_atom_url}/atom"
license=('MIT')
conflicts=('apm-bleeding' 'apm' 'atom')
provides=('apm-bleeding' 'apm' 'atom')
depends=('electron'
         'namcap'
         'npm'
         'libgnome-keyring'
         'nodejs'
         'python2')
optdepends=('ctags: symbol indexing support')
makedepends=('coffee-script' 'git')
options=(!emptydirs)
# git sources
source=("${url}/archive/v${_atomver}.tar.gz"
        "dark-bint-syntax::git+${_mur_url}/dark-bint-syntax.git"
        "fusion-ui::git+${_fus_url}/fusion-ui.git"
        "language-archlinux::git+${_fus_url}/language-archlinux.git"
        "language-gfm2::git+${_fus_url}/language-gfm2.git"
        "language-ini-desktop::git+${_fus_url}/language-ini-desktop.git"
        "language-liquid::git+https://github.com/puranjayjain/language-liquid.git"
        "language-patch2::git+${_fus_url}/language-patch2.git"
        "language-unix-shell::git+${_fus_url}/language-shellscript.git"
        "language-vala-modern::git+${_fus_url}/language-vala-modern.git"
        "terminal-fusion::git+${_fus_url}/terminal-fusion.git"
        "about::git+${_atom_url}/about.git"
        "apm::git+https://github.com/atom/apm.git#tag=v${_apmver}"
        "archive-view::git+${_atom_url}/archive-view.git"
        "autoflow::git+${_atom_url}/autoflow.git"
        "autosave::git+${_atom_url}/autosave.git"
        "background-tips::git+${_atom_url}/background-tips.git"
        "bookmarks::git+${_atom_url}/bookmarks.git"
        "bracket-matcher::git+${_atom_url}/bracket-matcher.git"
        "command-palette::git+${_atom_url}/command-palette.git"
        "deprecation-cop::git+${_atom_url}/deprecation-cop.git"
        "dev-live-reload::git+${_atom_url}/dev-live-reload.git"
        "encoding-selector::git+${_atom_url}/encoding-selector.git"
        "fuzzy-finder::git+${_atom_url}/fuzzy-finder.git"
        "git-diff::git+${_atom_url}/git-diff.git"
        "find-and-replace::git+${_atom_url}/find-and-replace.git"
        "go-to-line::git+${_atom_url}/go-to-line.git"
        "grammar-selector::git+${_atom_url}/grammar-selector.git"
        "hyperclick::git+https://github.com/facebooknuclideapm/hyperclick.git"
        "hyperlink-hyperclick::git+https://github.com/UziTech/hyperlink-hyperclick.git"
        "image-view::git+${_atom_url}/image-view.git"
        "incompatible-packages::git+${_atom_url}/incompatible-packages.git"
        "keybinding-resolver::git+${_atom_url}/keybinding-resolver.git"
        "line-ending-selector::git+${_atom_url}/line-ending-selector.git"
        "markdown-preview::git+${_atom_url}/markdown-preview.git"
        "notifications::git+${_atom_url}/notifications.git"
        "open-on-github::git+${_atom_url}/open-on-github.git"
        "package-generator::git+${_atom_url}/package-generator.git"
        "settings-view::git+${_atom_url}/settings-view.git"
        "snippets::git+${_atom_url}/snippets.git"
        "spell-check::git+${_atom_url}/spell-check.git"
        "status-bar::git+${_atom_url}/status-bar.git"
        "styleguide::git+${_atom_url}/styleguide.git"
        "symbols-view::git+${_atom_url}/symbols-view.git"
        "tabs::git+${_atom_url}/tabs.git"
        "timecop::git+${_atom_url}/timecop.git"
        "tree-view::git+${_atom_url}/tree-view.git"
        "update-package-dependencies::git+${_atom_url}/update-package-dependencies.git"
        "welcome::git+${_atom_url}/welcome.git"
        "whitespace::git+${_atom_url}/whitespace.git"
        "wrap-guide::git+${_atom_url}/wrap-guide.git"
        "language-c::git+${_atom_url}/language-c.git"
        "language-clojure::git+${_atom_url}/language-clojure.git"
        "language-coffee-script::git+${_atom_url}/language-coffee-script.git"
        "language-csharp::git+${_atom_url}/language-csharp.git"
        "language-css::git+${_atom_url}/language-css.git"
        "language-git::git+${_atom_url}/language-git.git"
        "language-go::git+${_atom_url}/language-go.git"
        "language-html::git+${_atom_url}/language-html.git"
        "language-hyperlink::git+${_atom_url}/language-hyperlink.git"
        "language-java::git+${_atom_url}/language-java.git"
        "language-javascript::git+${_atom_url}/language-javascript.git"
        "language-json::git+${_atom_url}/language-json.git"
        "language-less::git+${_atom_url}/language-less.git"
        "language-make::git+${_atom_url}/language-make.git"
        "language-mustache::git+${_atom_url}/language-mustache.git"
        "language-objective-c::git+${_atom_url}/language-objective-c.git"
        "language-perl::git+${_atom_url}/language-perl.git"
        "language-php::git+${_atom_url}/language-php.git"
        "language-property-list::git+${_atom_url}/language-property-list.git"
        "language-python::git+${_atom_url}/language-python.git"
        "language-ruby::git+${_atom_url}/language-ruby.git"
        "language-ruby-on-rails::git+${_atom_url}/language-ruby-on-rails.git"
        "language-sass::git+${_atom_url}/language-sass.git"
        "language-source::git+${_atom_url}/language-source.git"
        "language-sql::git+${_atom_url}/language-sql.git"
        "language-text::git+${_atom_url}/language-text.git"
        "language-todo::git+${_atom_url}/language-todo.git"
        "language-toml::git+${_atom_url}/language-toml.git"
        "language-xml::git+${_atom_url}/language-xml.git"
        "language-yaml::git+${_atom_url}/language-yaml.git"
        "autocomplete-atom-api::git+${_atom_url}/autocomplete-atom-api.git"
        "autocomplete-css::git+${_atom_url}/autocomplete-css.git"
        "autocomplete-html::git+${_atom_url}/autocomplete-html.git"
        "autocomplete-plus::git+${_atom_url}/autocomplete-plus.git"
        "autocomplete-snippets::git+${_atom_url}/autocomplete-snippets.git")
# patches, json, js and desktop files
source+=('atom-bleeding.desktop'
'atom.sh'
'beforeunload.patch'
'deprecated-api.patch'
'fix-license-path.patch'
'fix-oniguruma.patch'
'fix-ime-events-handler.patch'
'run-as-node.patch'
'theme.patch'
'use-system-apm.patch'
'use-system-electron.patch'
'apm.js'
'no-scripts.patch'
'upgrade.patch'
'fix-pane-resize-handle.patch'
'use-system-node-gyp.patch'
'symbols-view-use-system-ctags.patch')
sha256sums=('b7c09d03d950b0a6aca82225f072d9005d5681887e3a7c466b0504bf64d7c5cd'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1356775fd8fba63c23735e3041ac01d372d8e79670113ebcc90313fb55e2530d'
            '17e19ac310007e6b9b4bcd78c13b2a8322909cac15375aacd14c079253930341'
            '9c419697ed1ce272a864f1a89c91d4a2e314f88ba1dc6f1836468db6572f95b6'
            '4b978622b98d18affcd02e389b8410f4a6d33865c4aa02567a72a5c2c3b7030d'
            '883b0be8b68cda5d1004e99e8c1622ca633cf3eaf5c4aad7cc25f8dcb1235350'
            '70ba93703dbdecbea106a92127e40d3c153e1fd9519cf1bfd12202bf49840c5e'
            '25ccca2a773f6bf449691eac10fc4e78f5c2d264092c9f792177f6bd7ea32cce'
            '0f4ac8a595d76d77937258660fed913ac022468d4be8f090ed7d8da22432cefa'
            'af9e330192ba6540ff64fa9287d0af2b523f603042081effa464b393da4db49a'
            'e32b3a8f4b8e4295d4bb08c7958ad3ff6eeb931f1a18a38ecdbfafd796475f19'
            '59add99d0b25a145edb09134c59d4256360b6c24c261e479b223f24f2668b5cd'
            '0e607fef2a1a92d58fa5b7beca2a059bdbcc7ecd4198013baa1ffd05fff5446e'
            '0763015eb5ddb8346a5cef3479d80023d32382531d8a651c230c8f2144ba3628'
            'b3afc6d046f0b801afd3eb93bbe38ae0790a44ff64b09e777225d8446d895d4e'
            '1d5a4e6f2f928ebea64ee70c8a6ecf1935a1409ca7e50b02c70ae9f3315328b6'
            'ce8d45831e3d5071b7b913e8d1a014ec3b1ac3586194039006dcf87c100cc189'
            'd6ce1a5e16a42aa50c89848f36eaf2e5ef07a93f36dc740eaeb6ac7a6b3e0432')

pkgver() {
  function describe {
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=1` | sed 's/v//g')"
  }
  _apmver=$(describe apm)
  _autocomplete_plus_ver="$(describe autocomplete-plus)"
  _dark_bint_syntax_ver="$(describe dark-bint-syntax)"
  _fusion_ui_ver="$(describe fusion-ui)"
  _language_archlinux_ver="$(describe language-archlinux)"
  _language_c_ver="$(describe language-c)"
  _language_css_ver="$(describe language-css)"
  _language_javascript_ver="$(describe language-javascript)"
  _language_less_ver="$(describe language-less)"
  _language_perl_ver="$(describe language-perl)"
  _language_unix_shell_ver="$(describe language-unix-shell)"
  _markdown_preview_ver="$(describe markdown-preview)"
  _open_on_github_ver="$(describe open-on-github)"
  _spell_check_ver="$(describe spell-check)"
  _settings_view_ver="$(describe settings-view)"
  _tabs_ver="$(describe tabs)"
  _tf_ver="$(describe terminal-fusion)"
  _tree_view_ver="$(describe tree-view)"

  printf "${_atomver}.a${_apmver}.d${_dark_bint_syntax_ver}.e${_ELECTRON_VERSION}.f${_fusion_ui_ver}.la${_language_archlinux_ver}.lu${_language_unix_shell_ver}.m${_markdown_preview_ver}.o${_open_on_github_ver}.sc${_spell_check_ver}.sv${_settings_view_ver}.t${_tabs_ver}.tf${_tf_ver}.tv${_tree_view_ver}"
}

prepare() {
  function describe {
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=1` | sed 's/v//g')"
  }
  _apmver=$(describe apm)
  _dark_bint_syntax_ver="$(describe dark-bint-syntax)"
  _fusion_ui_ver="$(describe fusion-ui)"
  _hyperclick_ver="$(describe hyperclick)"
  _hyperlink_hyperclick_ver="$(describe hyperlink-hyperclick)"
  _language_archlinux_ver="$(describe language-archlinux)"
  _language_gfm2_ver="$(describe language-gfm2)"
  _language_ini_desktop_ver="$(describe language-ini-desktop)"
  _language_liquid_ver="$(describe language-liquid)"
  _language_patch2_ver="$(describe language-patch2)"
  _language_unix_shell_ver="$(describe language-unix-shell)"
  _language_vala_modern_ver="$(describe language-vala-modern)"
  _tf_ver="$(describe terminal-fusion)"

  ## apm
  rm -rf "${srcdir}"/apm-build
  sed -i -e "s/_this.installedAtomVersion = '.*'/_this.installedAtomVersion = '${_atomver}'/g" ${srcdir}/../upgrade.patch
  updpkgsums $srcdir/../PKGBUILD

  cd apm
  # Use custom launcher
  rm bin/apm{,.cmd} bin/npm{,.cmd}
  rm src/cli.coffee
  install -m755 ${srcdir}/apm.js bin/apm

  # Don't download binary Node
  patch -Np1 -i ${srcdir}/no-scripts.patch
  rm BUNDLED_NODE_VERSION script/*

  # Use system node-gyp
  patch -Np1 -i ../use-system-node-gyp.patch

  ## atom
  cd "${srcdir}/${_pkgname}-${_atomver}"

  sed -e "s|<SRCDIR>|$srcdir/apm-build|g" "${srcdir}"/use-system-apm.patch > $srcdir/use-system-apm-fix.patch

  patch -Np1 -i "${srcdir}"/use-system-electron.patch
  patch -Np1 -i "${srcdir}"/use-system-apm-fix.patch
  patch -Np1 -i "${srcdir}"/fix-license-path.patch

  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" \
         -e "/-ui/d" \
         -e "/-syntax/d" \
         -e "/-theme/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "/\"dependencies\": {/a \
                     \"language-patch2\": \"${_language_patch2_url}\"," \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-vala-modern\": \"${_language_vala_modern_ver}\",\n    \"language-archlinux\": \"${_language_archlinux_ver}\",\n    \"terminal-fusion\": \"${_tf_ver}\",/g" \
         -e "s/\"link\": \".*\",/\"hyperclick\": \"${_hyperclick_ver}\",\n    \"hyperlink-hyperclick\": \"${_hyperlink_hyperclick_ver}\",/g" package.json

  _L=("about"
  "archive-view"
  "autocomplete-atom-api"
  "autocomplete-css"
  "autocomplete-html"
  "autocomplete-plus"
  "autocomplete-snippets"
  "autoflow"
  "autosave"
  "background-tips"
  "bookmarks"
  "bracket-matcher"
  "command-palette"
  "deprecation-cop"
  "dev-live-reload"
  "encoding-selector"
  "fuzzy-finder"
  "git-diff"
  "find-and-replace"
  "go-to-line"
  "grammar-selector"
  "image-view"
  "incompatible-packages"
  "keybinding-resolver"
  "line-ending-selector"
  "markdown-preview"
  "notifications"
  "open-on-github"
  "package-generator"
  "settings-view"
  "snippets"
  "spell-check"
  "status-bar"
  "styleguide"
  "symbols-view"
  "tabs"
  "timecop"
  "tree-view"
  "update-package-dependencies"
  "welcome"
  "whitespace"
  "wrap-guide"
  "language-c"
  "language-clojure"
  "language-coffee-script"
  "language-csharp"
  "language-css"
  "language-git"
  "language-go"
  "language-html"
  "language-hyperlink"
  "language-java"
  "language-javascript"
  "language-json"
  "language-less"
  "language-make"
  "language-mustache"
  "language-objective-c"
  "language-perl"
  "language-php"
  "language-property-list"
  "language-python"
  "language-ruby"
  "language-ruby-on-rails"
  "language-sass"
  "language-source"
  "language-sql"
  "language-text"
  "language-todo"
  "language-toml"
  "language-xml"
  "language-yaml")

  for i in "${_L[@]}"
  do
    unset ver
    ver="$(git -C "$srcdir/$i" describe --tags `git -C "$srcdir/$i" rev-list --tags --max-count=1` | sed 's/v//g')"
    sed -i -e "s/\"$i\": \".*\"/\"$i\": \"$ver\"/g" package.json
  done

  # Fix for Electron 1.2.0
  patch -Np1 -i "${srcdir}"/beforeunload.patch
  patch -Np1 -i "${srcdir}"/run-as-node.patch

  # Fix for Electron 1.3.0
  patch -Np1 -i "${srcdir}"/fix-pane-resize-handle.patch

  # Fix for Electron 1.4.0
  patch -Np1 -i "${srcdir}"/fix-ime-events-handler.patch

  # Theme patch
  patch -Np1 -i "${srcdir}"/theme.patch
}

build() {
  ## apm
  cd apm

  coffee -c --no-header -o lib src/*.coffee
  npm install --user root -g --prefix="${srcdir}"/apm-build/usr

  cd "${srcdir}/apm-build${_apmdir}"

  # Use system npm
  npm uninstall npm

  npm dedupe

  ## atom
  cd "${srcdir}/${_pkgname}-${_atomver}"

  export ATOM_RESOURCE_PATH="$srcdir/${_pkgname}"
  # If unset, ~/.atom/.node-gyp/.atom/.npm is used
  export NPM_CONFIG_CACHE="${HOME}/.atom/.npm"

  # Make sure NodeGit builds from source and with the correct runtime
  export BUILD_ONLY=1
  export ELECTRON_VERSION=${_ELECTRON_VERSION}
  export APMBIN="$srcdir/apm-build/usr/lib/node_modules/atom-package-manager/bin/apm"

  $APMBIN clean
  # -Wl,-z,noexecstack to make sure nodegit.node does not have executable stack
  $APMBIN install

  # Use system ctags
  cd node_modules/symbols-view
  patch -Np1 -i "${srcdir}"/symbols-view-use-system-ctags.patch
  rm -r vendor
  cd ../..

  # Fix for Electron 1.3.0
  _node_gyp="node-gyp rebuild --target=${_ELECTRON_VERSION} --dist-url=https://atom.io/download/atom-shell"
  cd node_modules/oniguruma
  patch -Np1 -i "${srcdir}"/fix-oniguruma.patch
  ${_node_gyp}
  cd ../../

  cd script && npm install && ./build
}

package() {
  ## apm
  cp -r "${srcdir}"/apm-build/usr "${pkgdir}"
  rm $pkgdir/usr/bin/apm
  cd $pkgdir/usr/bin/
  ln -sf ../lib/node_modules/atom-package-manager/bin/apm apm-bleeding

  cd "${pkgdir}"${_apmdir}

  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/apm/
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/atom/
  install -Dm644 "${srcdir}"/apm/README.md ${pkgdir}/usr/share/doc/${pkgname}/apm/README.md
  install -Dm644 "${srcdir}"/atom-${_atomver}/README.md ${pkgdir}/usr/share/doc/${pkgname}/atom/README.md
  install -Dm644 "${srcdir}/atom-${_atomver}/package.json" "${pkgdir}/usr/share/doc/${pkgname}/atom/package.json"

  # Install license file
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/{apm,atom}"
  ln -s ../../../lib/node_modules/atom-package-manager/LICENSE.md \
     "${pkgdir}/usr/share/licenses/${pkgname}/apm"

  # Remove occurrences of ${srcdir}
  find "${pkgdir}" -name "package.json" \
       -exec sed -e "s|${srcdir}/apm-build||" \
                 -e "s|${srcdir}/apm|${_apmdir}|" \
                 -i '{}' \;

  # Remove useless stuff
  find "${pkgdir}"/usr/lib \
      -name ".*" -prune -exec rm -r '{}' \; \
      -or -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "*.mk" -exec rm '{}' \; \
      -or -path "*/git-utils/binding.gyp" -exec rm '{}' \; \
      -or -path "*/git-utils/src" -prune -exec rm -r '{}' \; \
      -or -path "*/keytar/binding.gyp" -exec rm '{}' \; \
      -or -path "*/keytar/src" -prune -exec rm -r '{}' \; \
      -or -path "*/oniguruma/binding.gyp" -exec rm '{}' \; \
      -or -path "*/oniguruma/src" -prune -exec rm -r '{}' \; \
      -or -name "*.yml" -exec rm '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "binding.Makefile" -exec rm '{}' \; \
      -or -name "config.gypi" -exec rm '{}' \; \
      -or -name "deps" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "Makefile" -exec rm '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -name "obj.target" -prune -exec rm -r '{}' \; \
      -or -name "samples" -prune -exec rm -r '{}' \; \
      -or -name "test" -prune -exec rm -r '{}' \; \
      -or -name "tests" -prune -exec rm -r '{}' \;
  cd "$pkgdir"
  patch -Np1 -i "$srcdir/upgrade.patch"

  ## atom
  cd "${srcdir}/${_pkgname}-${_atomver}"

  _LIB="/usr/lib/${pkgname}"
  _ALIBDIR="${pkgdir}/${_LIB}"

  install -dm755 "${pkgdir}/usr/lib"
  cp -r out/app ${_ALIBDIR}

  install -Dm644 "resources/app-icons/stable/png/1024.png" "${pkgdir}/usr/share/pixmaps/atom-bleeding.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm755 "$srcdir/${pkgname}.desktop" \
          "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm755 "$srcdir/atom.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/atom"
  node -e "require('./script/lib/get-license-text')().then((licenseText) => require('fs').writeFileSync('${pkgdir}/usr/share/licenses/${pkgname}/atom/LICENSE.md', licenseText))"

  # Remove useless stuff
  find "${_ALIBDIR}/node_modules" \
      -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
      -or -path "*/task-lists/src" -prune -exec rm -r '{}' \; \
      -or -name "package.json" -exec sed -i -e "s|$srcdir|${_LIB}|g" '{}' +

  rm -rf "${pkgdir}/usr/etc"
}
