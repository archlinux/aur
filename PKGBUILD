# Maintainer: Julian Houba <info@craftingdragon.ch>
pkgname=opengrep
pkgver=1.27.0
pkgrel=1
_memprof_limits_commit=c2cced325a93d2271379f0712db85867b29dbee1
_semgrep_interfaces_commit=977c2a9b30e472c303930104414184c76bbadda8
_semgrep_apex_commit=024974494b1042141388e1efda11cd5dbcc273e3
_semgrep_bash_commit=aa7d8eec0714a1e1492a1dcbac32c883a58bb6da
_semgrep_cairo_commit=a8e2d5d5dcf8345735b15268b76b24377103a188
_semgrep_circom_commit=a6084cd52d1dbae28365635934279c0100e89762
_semgrep_cpp_commit=eddec4922e67e757c546cdec7e640a6e7b0ecba4
_opengrep_crystal_commit=f279484792c259278c4e135e8f1048bbcea7c358
_semgrep_c_sharp_commit=75c7277df0202ad6f8f8db968c38733ecdb9ea4e
_semgrep_dart_commit=8e04531936bca9f508692e97646019abfd4c2774
_semgrep_dockerfile_commit=783ee02353d0da80c03e74598394b2fb84745deb
_semgrep_elixir_commit=dc48d05492c8d2020698f832ec43974bdd9aae15
_semgrep_go_commit=51ff7be525c452c0201b3969b3117f7bf8e588dc
_semgrep_hack_commit=d803e5719874de90ba9a0db9c6f7ba08314c50be
_semgrep_html_commit=0b0f69e7d12ba20625b3af5223aa3ca9767d38bd
_semgrep_java_commit=8b9830231a447945d7af372d29720496e3058782
_semgrep_jsonnet_commit=fde344cc44f2787f8afd9b28c4b70f04ced32c41
_semgrep_julia_commit=885a1421f27e20c36e18eadb18c8f79cb8d54298
_semgrep_kotlin_commit=a7d508fe9b623fb9d5c9e90b47a1eba704908110
_semgrep_clojure_commit=754ea8a63c06e16984b9c7b4e2713bc160667c87
_semgrep_lua_commit=6fe7090fe8c1dd2193211af0443fa902e16bba74
_semgrep_move_on_aptos_commit=257a384fca87ce6831670b4aac5296a382cf6974
_semgrep_move_on_sui_commit=4fe01c06c24ada6a9b0a99d49cc488964fa11046
_semgrep_ocaml_commit=9ba9be79844df3e560da2d2c77e160b3f827a8ce
_semgrep_php_commit=0b2ef9bc28ae87200af5cd85ff5e53fc5306cbef
_semgrep_promql_commit=5e9ca596499c5730a0bc687bd806ca28f5a99a46
_semgrep_proto_commit=9e169500bdfadb93cbf6ec92094581e88b1369a6
_semgrep_python_commit=0a623865209259662df6606946805756997c0074
_semgrep_ql_commit=55749f3c2124dfe1661453ab0790042035a16d41
_semgrep_r_commit=06fa8af03dca9aa293efd603ba107faf7e82a3c3
_semgrep_ruby_commit=a824639aeb646c03b5bbc74c3fc5844ed691e7b7
_semgrep_rust_commit=fa0ae954dfd2c62c4aba9781e5f0fcc584c4a248
_semgrep_solidity_commit=968fd0d7096720e72c9870933ae7afa58221278f
_semgrep_swift_commit=7214b8436dd77d5dede681b05905009bb14c64a9
_semgrep_hcl_commit=546b85986d1965450ba942eea71cc80f55ea39ee
_semgrep_tsx_commit=4293c1bc21f441ccfa3b0fa4306a9978ee9ec0b7
_semgrep_typescript_commit=08a13a2a846e6d64dc859435be5f0214dff2d72c
_ocaml_tree_sitter_core_commit=1392efc21e60d5acde72d0d1c6586f5692fedace
_pcre2_ocaml_commit=51cde0d79f8d72562b4d4ebfb07d4bbe719249c6
_testo_commit=634c978b8c03f02f8f172820fed4554aff721313
_semgrep_rules_commit=40b8c63f75dc7c22c8a77482d73bfb864b146f7e
_opam_switch_stamp=3
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code. Fork of semgrep"
arch=('x86_64' 'aarch64')
url="https://github.com/opengrep/opengrep"
license=('LGPL-2.1-only')

depends=(
  'gmp'
  'libev'
  'pcre'
  'pcre2'
  'python'
  'python-attrs'
  'python-boltons'
  'python-click-option-group'
  'python-click'
  'python-colorama'
  'python-glom'
  'python-jsonschema'
  'python-packaging'
  'python-peewee'
  'python-requests'
  'python-rich'
  'python-ruamel-yaml'
  'python-typing_extensions'
  'python-urllib3'
  'python-wcmatch'
  'tree-sitter'
)
makedepends=(
  'dune'
  'git'
  'ocaml'
  'opam'
  'pkgconf'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_submodules=(
  "OSS/cli/src/semgrep/semgrep_interfaces|cli/src/semgrep/semgrep_interfaces|semgrep-interfaces|https://github.com/opengrep/semgrep-interfaces.git|${_semgrep_interfaces_commit}"
  "languages/apex/tree-sitter/semgrep-apex|languages/apex/tree-sitter/semgrep-apex|semgrep-apex|https://github.com/opengrep/semgrep-apex.git|${_semgrep_apex_commit}"
  "OSS/languages/bash/tree-sitter/semgrep-bash|languages/bash/tree-sitter/semgrep-bash|semgrep-bash|https://github.com/opengrep/semgrep-bash|${_semgrep_bash_commit}"
  "OSS/languages/cairo/tree-sitter/semgrep-cairo|languages/cairo/tree-sitter/semgrep-cairo|semgrep-cairo|https://github.com/opengrep/semgrep-cairo|${_semgrep_cairo_commit}"
  "OSS/languages/circom/tree-sitter/semgrep-circom|languages/circom/tree-sitter/semgrep-circom|semgrep-circom|https://github.com/opengrep/semgrep-circom.git|${_semgrep_circom_commit}"
  "OSS/languages/cpp/tree-sitter/semgrep-cpp|languages/cpp/tree-sitter/semgrep-cpp|semgrep-cpp|https://github.com/opengrep/semgrep-cpp|${_semgrep_cpp_commit}"
  "OSS/languages/crystal/tree-sitter/opengrep-crystal|languages/crystal/tree-sitter/opengrep-crystal|opengrep-crystal|https://github.com/opengrep/opengrep-crystal|${_opengrep_crystal_commit}"
  "OSS/languages/csharp/tree-sitter/semgrep-c-sharp|languages/csharp/tree-sitter/semgrep-c-sharp|semgrep-c-sharp|https://github.com/opengrep/semgrep-c-sharp|${_semgrep_c_sharp_commit}"
  "OSS/languages/dart/tree-sitter/semgrep-dart|languages/dart/tree-sitter/semgrep-dart|semgrep-dart|https://github.com/opengrep/semgrep-dart.git|${_semgrep_dart_commit}"
  "OSS/languages/dockerfile/tree-sitter/semgrep-dockerfile|languages/dockerfile/tree-sitter/semgrep-dockerfile|semgrep-dockerfile|https://github.com/opengrep/semgrep-dockerfile|${_semgrep_dockerfile_commit}"
  "OSS/languages/elixir/tree-sitter/semgrep-elixir|languages/elixir/tree-sitter/semgrep-elixir|semgrep-elixir|https://github.com/opengrep/semgrep-elixir.git|${_semgrep_elixir_commit}"
  "OSS/languages/go/tree-sitter/semgrep-go|languages/go/tree-sitter/semgrep-go|semgrep-go|https://github.com/opengrep/semgrep-go|${_semgrep_go_commit}"
  "OSS/languages/tree-sitter-lang/semgrep-hack|languages/hack/tree-sitter/semgrep-hack|semgrep-hack|https://github.com/opengrep/semgrep-hack.git|${_semgrep_hack_commit}"
  "OSS/languages/html/tree-sitter/semgrep-html|languages/html/tree-sitter/semgrep-html|semgrep-html|https://github.com/opengrep/semgrep-html.git|${_semgrep_html_commit}"
  "OSS/languages/java/tree-sitter/semgrep-java|languages/java/tree-sitter/semgrep-java|semgrep-java|https://github.com/opengrep/semgrep-java|${_semgrep_java_commit}"
  "OSS/languages/jsonnet/tree-sitter/semgrep-jsonnet|languages/jsonnet/tree-sitter/semgrep-jsonnet|semgrep-jsonnet|https://github.com/opengrep/semgrep-jsonnet.git|${_semgrep_jsonnet_commit}"
  "OSS/languages/julia/tree-sitter/semgrep-julia|languages/julia/tree-sitter/semgrep-julia|semgrep-julia|https://github.com/opengrep/semgrep-julia.git|${_semgrep_julia_commit}"
  "OSS/languages/kotlin/tree-sitter/semgrep-kotlin|languages/kotlin/tree-sitter/semgrep-kotlin|semgrep-kotlin|https://github.com/opengrep/semgrep-kotlin.git|${_semgrep_kotlin_commit}"
  "OSS/languages/lisp/tree-sitter/semgrep-clojure|languages/lisp/tree-sitter/semgrep-clojure|semgrep-clojure|https://github.com/opengrep/semgrep-clojure.git|${_semgrep_clojure_commit}"
  "OSS/languages/lua/tree-sitter/semgrep-lua|languages/lua/tree-sitter/semgrep-lua|semgrep-lua|https://github.com/opengrep/semgrep-lua|${_semgrep_lua_commit}"
  "OSS/languages/move-on-aptos/tree-sitter/semgrep-move-on-aptos|languages/move_on_aptos/tree-sitter/semgrep-move-on-aptos|semgrep-move-on-aptos|https://github.com/opengrep/semgrep-move-on-aptos.git|${_semgrep_move_on_aptos_commit}"
  "OSS/languages/move_on_sui/tree-sitter/semgrep-move-on-sui|languages/move_on_sui/tree-sitter/semgrep-move-on-sui|semgrep-move-on-sui|https://github.com/opengrep/semgrep-move-on-sui.git|${_semgrep_move_on_sui_commit}"
  "OSS/languages/ocaml/tree-sitter/semgrep-ocaml|languages/ocaml/tree-sitter/semgrep-ocaml|semgrep-ocaml|https://github.com/opengrep/semgrep-ocaml.git|${_semgrep_ocaml_commit}"
  "OSS/languages/php/tree-sitter/semgrep-php|languages/php/tree-sitter/semgrep-php|semgrep-php|https://github.com/opengrep/semgrep-php|${_semgrep_php_commit}"
  "OSS/languages/promql/tree-sitter/semgrep-promql|languages/promql/tree-sitter/semgrep-promql|semgrep-promql|https://github.com/opengrep/semgrep-promql.git|${_semgrep_promql_commit}"
  "OSS/languages/protobuf/tree-sitter/semgrep-proto|languages/protobuf/tree-sitter/semgrep-proto|semgrep-proto|https://github.com/opengrep/semgrep-proto.git|${_semgrep_proto_commit}"
  "OSS/languages/python/tree-sitter/semgrep-python|languages/python/tree-sitter/semgrep-python|semgrep-python|https://github.com/opengrep/semgrep-python.git|${_semgrep_python_commit}"
  "OSS/languages/ql/tree-sitter/semgrep-ql|languages/ql/tree-sitter/semgrep-ql|semgrep-ql|https://github.com/opengrep/semgrep-ql|${_semgrep_ql_commit}"
  "OSS/languages/r/tree-sitter/semgrep-r|languages/r/tree-sitter/semgrep-r|semgrep-r|https://github.com/opengrep/semgrep-r|${_semgrep_r_commit}"
  "OSS/languages/ruby/tree-sitter/semgrep-ruby|languages/ruby/tree-sitter/semgrep-ruby|semgrep-ruby|https://github.com/opengrep/semgrep-ruby.git|${_semgrep_ruby_commit}"
  "OSS/languages/rust/tree-sitter/semgrep-rust|languages/rust/tree-sitter/semgrep-rust|semgrep-rust|https://github.com/opengrep/semgrep-rust|${_semgrep_rust_commit}"
  "OSS/languages/solidity/tree-sitter/semgrep-solidity|languages/solidity/tree-sitter/semgrep-solidity|semgrep-solidity|https://github.com/opengrep/semgrep-solidity.git|${_semgrep_solidity_commit}"
  "OSS/languages/swift/tree-sitter/semgrep-swift|languages/swift/tree-sitter/semgrep-swift|semgrep-swift|https://github.com/opengrep/semgrep-swift.git|${_semgrep_swift_commit}"
  "OSS/languages/terraform/tree-sitter/semgrep-hcl|languages/terraform/tree-sitter/semgrep-hcl|semgrep-hcl|https://github.com/opengrep/semgrep-hcl|${_semgrep_hcl_commit}"
  "OSS/languages/typescript/tree-sitter/semgrep-tsx|languages/typescript/tree-sitter/semgrep-tsx|semgrep-tsx|https://github.com/opengrep/semgrep-tsx|${_semgrep_tsx_commit}"
  "OSS/languages/typescript/tree-sitter/semgrep-typescript|languages/typescript/tree-sitter/semgrep-typescript|semgrep-typescript|https://github.com/opengrep/semgrep-typescript|${_semgrep_typescript_commit}"
  "OSS/libs/ocaml-tree-sitter-core|libs/ocaml-tree-sitter-core|ocaml-tree-sitter-core|https://github.com/opengrep/ocaml-tree-sitter-core.git|${_ocaml_tree_sitter_core_commit}"
  "OSS/libs/pcre2|libs/pcre2|pcre2-ocaml|https://github.com/semgrep/pcre2-ocaml|${_pcre2_ocaml_commit}"
  "OSS/libs/testo|libs/testo|testo|https://github.com/semgrep/testo.git|${_testo_commit}"
  "OSS/tests/semgrep-rules|tests/semgrep-rules|semgrep-rules|https://github.com/semgrep/semgrep-rules.git|${_semgrep_rules_commit}"
)

source=(
  "${pkgname}::git+https://github.com/opengrep/opengrep.git#tag=v${pkgver}"
  "memprof-limits::git+https://gitlab.com/dimitris-m/memprof-limits.git#commit=${_memprof_limits_commit}"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

for _submodule in "${_submodules[@]}"; do
  IFS='|' read -r _name _path _repo _url _commit <<< "${_submodule}"
  source+=("${_repo}::git+${_url}#commit=${_commit}")
  sha256sums+=('SKIP')
done

prepare() {
  cd "${pkgname}"

  local _commit _name _path _repo _submodule _url
  local -a _submodule_paths=()

  git submodule init

  for _submodule in "${_submodules[@]}"; do
    IFS='|' read -r _name _path _repo _url _commit <<< "${_submodule}"
    git config "submodule.${_name}.url" "${srcdir}/${_repo}"
    _submodule_paths+=("${_path}")
  done

  git -c protocol.file.allow=always submodule update --init --force "${_submodule_paths[@]}"

  sed -i \
    '/^# Remove all symbols with GNU strip/,/^\tstrip bin\/opengrep-core$(EXE)$/d' \
    Makefile

  cd libs/ocaml-tree-sitter-core
  ./configure --prefix /usr
  sed -i \
    -e 's|^PATH := .*|PATH := $(PATH):$(TREESITTER_BINDIR)|' \
    -e 's|^PATH=.*|PATH=$PATH:$TREESITTER_BINDIR|' \
    tree-sitter-config.mk tree-sitter-config.sh
}

build() {
  cd "${pkgname}"

  export OPAMROOT="${srcdir}/opam-root"
  export OPAMYES=1
  export OPAMERRLOGLEN=0

  local _switch_stamp= _system_ocamlver
  _system_ocamlver="$(ocamlc -version)"

  if [[ ! -d "${OPAMROOT}" ]]; then
    opam init --bare --disable-sandboxing --no-setup
  fi

  if opam switch list --short | grep -Fxq "${pkgname}"; then
    if [[ -f "${OPAMROOT}/${pkgname}/.opengrep-package-switch" ]]; then
      _switch_stamp="$(<"${OPAMROOT}/${pkgname}/.opengrep-package-switch")"
    fi
    if [[ "$(opam exec --switch="${pkgname}" -- ocamlc -version 2>/dev/null)" != "${_system_ocamlver}" ]] || \
       [[ "${_switch_stamp}" != "${_opam_switch_stamp}" ]]; then
      opam switch remove -y "${pkgname}"
    fi
  fi

  if ! opam switch list --short | grep -Fxq "${pkgname}"; then
    opam switch create "${pkgname}" ocaml-system
  fi

  export OCAMLPATH="${OPAMROOT}/${pkgname}/lib"

  opam pin --switch="${pkgname}" add -n -k path \
    memprof-limits.dev "${srcdir}/memprof-limits"

  LDFLAGS= OPAMSOLVERTIMEOUT=1200 opam install --switch="${pkgname}" \
    --assume-depexts \
    --ignore-pin-depends \
    --deps-only \
    ./opam/semgrep.opam \
    ./libs/ocaml-tree-sitter-core/tree-sitter.opam

  printf '%s\n' "${_opam_switch_stamp}" > "${OPAMROOT}/${pkgname}/.opengrep-package-switch"

  opam exec --switch="${pkgname}" -- make core

  install -Dm755 bin/opengrep-core \
    cli/src/semgrep/bin/opengrep-core

  cd cli
  rm -rf dist
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"

  local _lang="${LANG-}" _lang_is_set="${LANG+x}" _status

  export OPAMROOT="${srcdir}/opam-root"
  export OPAMYES=1
  export OPAMERRLOGLEN=0
  export OCAMLPATH="${OPAMROOT}/${pkgname}/lib"
  export LANG=C # Needed for e2e and git tests to pass

  if opam exec --switch="${pkgname}" -- make core-test; then
    _status=0
  else
    _status=$?
  fi

  if [[ -n "${_lang_is_set}" ]]; then
    export LANG="${_lang}"
  else
    unset LANG
  fi

  return "${_status}"
}

package() {
  cd "${pkgname}/cli"

  local -a _wheels
  shopt -s nullglob
  _wheels=(dist/*.whl)
  if (( ${#_wheels[@]} != 1 )); then
    error "Expected exactly one wheel in cli/dist, found ${#_wheels[@]}"
    return 1
  fi

  python -m installer --destdir="${pkgdir}" "${_wheels[0]}"

  cd ..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
