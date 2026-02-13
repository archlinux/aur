#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./aur-release.sh prepare [--deb-url URL] [--upload [upload options]]
  ./aur-release.sh finalize --zst-url URL [--commit] [--push] [--message MSG]
  ./aur-release.sh walkthrough

Commands:
  prepare   Build package from upstream .deb and update _magelab_deb_* in PKGBUILD.
  finalize  Update _magelab_zst_* in PKGBUILD, refresh .SRCINFO, optionally commit/push.
  walkthrough
            Interactive end-to-end flow: prompt for .deb URL, build, finalize, commit, push.

Options:
  --deb-url URL    Override _magelab_deb_url during prepare.
  --upload         Upload an asset with crabnebula CLI (cn release upload).
  --upload-app X   App slug for upload (default: sapient-artifice/mage-lab).
  --upload-version X
                   Release version for upload (default: pkgver from PKGBUILD).
  --upload-platform X
                   --public-platform value (default: pacman-x86_64).
  --upload-file X  File to upload (default: built magelab-bin-<pkgver>-<pkgrel>-x86_64.pkg.tar.zst).
  --upload-signature X
                   Signature path passed to --signature (default: auto-generate <file>.sig via gpg).
  --upload-gpg-key X
                   GPG key id/email to use when auto-generating signature.
  --upload-channel X
                   Release channel for upload (default: beta).
  --zst-url URL    Hosted URL for built .pkg.tar.zst (required for finalize).
  --commit         Create a git commit for PKGBUILD/.SRCINFO changes.
  --push           Push commit to origin (implies --commit).
  --message MSG    Custom commit message.
  -h, --help       Show this help text.
USAGE
}

die() {
  echo "error: $*" >&2
  exit 1
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "required command not found: $1"
}

ensure_repo_root() {
  [[ -f PKGBUILD ]] || die "run from the repo root (PKGBUILD not found)"
}

read_pkg_var() {
  local key="$1"
  awk -F'=' -v k="$key" '$1 == k {print $2; exit}' PKGBUILD
}

escape_sed_repl() {
  printf '%s' "$1" | sed -e 's/[\\&|]/\\&/g'
}

set_pkgbuild_var() {
  local key="$1"
  local raw_value="$2"
  local quote_style="${3:-single}"
  local value
  value="$(escape_sed_repl "$raw_value")"

  case "$quote_style" in
    single)
      sed -i -E "s|^${key}=.*$|${key}='${value}'|" PKGBUILD
      ;;
    double)
      sed -i -E "s|^${key}=.*$|${key}=\"${value}\"|" PKGBUILD
      ;;
    plain)
      sed -i -E "s|^${key}=.*$|${key}=${value}|" PKGBUILD
      ;;
    *)
      die "invalid quote style for $key: $quote_style"
      ;;
  esac
}

extract_deb_version_from_url() {
  local url="$1"
  local filename
  filename="${url##*/}"
  filename="${filename%%\?*}"

  if [[ "$filename" =~ ^magelab_([^_]+)_amd64\.deb$ ]]; then
    printf '%s' "${BASH_REMATCH[1]}"
    return 0
  fi

  # Some providers use opaque asset paths; match version if the filename appears
  # anywhere in the URL (path/query), e.g. redirect or query-based filenames.
  if [[ "$url" =~ magelab_([^_/?&]+)_amd64\.deb ]]; then
    printf '%s' "${BASH_REMATCH[1]}"
    return 0
  fi
  return 1
}

confirm() {
  local prompt="$1"
  local default="${2:-Y}"
  local answer=""

  if [[ "$default" == "Y" ]]; then
    read -r -p "$prompt [Y/n] " answer
    [[ -z "$answer" || "$answer" =~ ^[Yy]$ ]]
  else
    read -r -p "$prompt [y/N] " answer
    [[ "$answer" =~ ^[Yy]$ ]]
  fi
}

pkg_filename() {
  local pkgver pkgrel
  pkgver="$(read_pkg_var pkgver)"
  pkgrel="$(read_pkg_var pkgrel)"
  [[ -n "$pkgver" && -n "$pkgrel" ]] || die "failed to read pkgver/pkgrel from PKGBUILD"
  printf 'magelab-bin-%s-%s-x86_64.pkg.tar.zst' "$pkgver" "$pkgrel"
}

run_prepare() {
  local deb_url=""
  local do_upload=0
  local upload_app="sapient-artifice/mage-lab"
  local upload_version=""
  local upload_platform="pacman-x86_64"
  local upload_file=""
  local upload_signature=""
  local upload_gpg_key=""
  local upload_channel="beta"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --deb-url)
        [[ $# -ge 2 ]] || die "--deb-url requires a value"
        deb_url="$2"
        shift 2
        ;;
      --upload)
        do_upload=1
        shift
        ;;
      --upload-app)
        [[ $# -ge 2 ]] || die "--upload-app requires a value"
        upload_app="$2"
        shift 2
        ;;
      --upload-version)
        [[ $# -ge 2 ]] || die "--upload-version requires a value"
        upload_version="$2"
        shift 2
        ;;
      --upload-platform)
        [[ $# -ge 2 ]] || die "--upload-platform requires a value"
        upload_platform="$2"
        shift 2
        ;;
      --upload-file)
        [[ $# -ge 2 ]] || die "--upload-file requires a value"
        upload_file="$2"
        shift 2
        ;;
      --upload-signature)
        [[ $# -ge 2 ]] || die "--upload-signature requires a value"
        upload_signature="$2"
        shift 2
        ;;
      --upload-gpg-key)
        [[ $# -ge 2 ]] || die "--upload-gpg-key requires a value"
        upload_gpg_key="$2"
        shift 2
        ;;
      --upload-channel)
        [[ $# -ge 2 ]] || die "--upload-channel requires a value"
        upload_channel="$2"
        shift 2
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        die "unknown option for prepare: $1"
        ;;
    esac
  done

  need_cmd makepkg
  need_cmd sha256sum
  need_cmd curl
  need_cmd git

  local pkgver deb_asset deb_sha deb_source_url out_pkg out_sha
  pkgver="$(read_pkg_var pkgver)"
  [[ -n "$pkgver" ]] || die "failed to read pkgver"
  if [[ -z "$upload_version" ]]; then
    upload_version="$pkgver"
  fi

  if [[ -n "$deb_url" ]]; then
    set_pkgbuild_var "_magelab_deb_url" "$deb_url" double
  fi

  deb_source_url="$(read_pkg_var _magelab_deb_url | sed -e 's/^"//' -e 's/"$//')"
  [[ -n "$deb_source_url" ]] || die "_magelab_deb_url is empty"

  deb_asset="magelab_${pkgver}_amd64.deb"
  echo "==> Downloading $deb_asset"
  curl --fail --location --silent --show-error "$deb_source_url" --output "$deb_asset"

  deb_sha="$(sha256sum "$deb_asset" | awk '{print $1}')"
  set_pkgbuild_var "_magelab_deb_sha256" "$deb_sha" single

  echo "==> Cleaning old build dirs"
  rm -rf src pkg

  echo "==> Building package from .deb"
  MAGELAB_BUILD_FROM_DEB=1 makepkg -df

  out_pkg="$(pkg_filename)"
  [[ -f "$out_pkg" ]] || die "expected output package not found: $out_pkg"

  out_sha="$(sha256sum "$out_pkg" | awk '{print $1}')"

  if [[ "$do_upload" -eq 1 ]]; then
    need_cmd cn
    need_cmd gpg

    if [[ -z "$upload_file" ]]; then
      upload_file="$out_pkg"
    fi
    [[ -f "$upload_file" ]] || die "upload file not found: $upload_file"

    if [[ -z "$upload_signature" ]]; then
      upload_signature="${upload_file}.sig"
      echo "==> Generating signature: $upload_signature"
      local gpg_cmd=(gpg --batch --yes --detach-sign --output "$upload_signature")
      if [[ -n "$upload_gpg_key" ]]; then
        gpg_cmd+=(--local-user "$upload_gpg_key")
      fi
      gpg_cmd+=("$upload_file")
      "${gpg_cmd[@]}"
    else
      [[ -f "$upload_signature" ]] || die "upload signature not found: $upload_signature"
    fi

    echo "==> Uploading package with cn"
    local upload_cmd=(
      cn release upload "$upload_app" "$upload_version"
      --public-platform "$upload_platform"
      --file "$upload_file"
      --signature "$upload_signature"
      --channel "$upload_channel"
    )
    "${upload_cmd[@]}"
  fi

  echo
  echo "Prepare complete:"
  echo "  deb url:  $deb_source_url"
  echo "  deb sha:  $deb_sha"
  echo "  built:    $out_pkg"
  echo "  pkg sha:  $out_sha"
  echo
  echo "Next steps:"
  echo "  1) Upload $out_pkg to your CDN"
  echo "  2) Run: ./aur-release.sh finalize --zst-url <uploaded-url> --commit --push"
}

run_finalize() {
  local zst_url=""
  local do_commit=0
  local do_push=0
  local commit_msg=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --zst-url)
        [[ $# -ge 2 ]] || die "--zst-url requires a value"
        zst_url="$2"
        shift 2
        ;;
      --commit)
        do_commit=1
        shift
        ;;
      --push)
        do_push=1
        do_commit=1
        shift
        ;;
      --message)
        [[ $# -ge 2 ]] || die "--message requires a value"
        commit_msg="$2"
        shift 2
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        die "unknown option for finalize: $1"
        ;;
    esac
  done

  [[ -n "$zst_url" ]] || die "--zst-url is required for finalize"

  need_cmd makepkg
  need_cmd sha256sum
  need_cmd git

  local out_pkg out_sha pkgver pkgrel
  out_pkg="$(pkg_filename)"
  [[ -f "$out_pkg" ]] || die "build artifact not found: $out_pkg (run prepare first)"

  out_sha="$(sha256sum "$out_pkg" | awk '{print $1}')"
  set_pkgbuild_var "_magelab_zst_url" "$zst_url" double
  set_pkgbuild_var "_magelab_zst_sha256" "$out_sha" single

  echo "==> Refreshing .SRCINFO"
  makepkg --printsrcinfo > .SRCINFO

  echo "Finalize complete:"
  echo "  zst url: $zst_url"
  echo "  zst sha: $out_sha"

  if [[ "$do_commit" -eq 1 ]]; then
    pkgver="$(read_pkg_var pkgver)"
    pkgrel="$(read_pkg_var pkgrel)"
    if [[ -z "$commit_msg" ]]; then
      commit_msg="magelab-bin: release ${pkgver}-${pkgrel}"
    fi

    git add PKGBUILD .SRCINFO
    git commit -m "$commit_msg"
    echo "==> Created commit: $commit_msg"
  fi

  if [[ "$do_push" -eq 1 ]]; then
    # AUR metadata tracks master; push HEAD explicitly there.
    git push origin HEAD:master
    echo "==> Pushed to origin/master"
  fi
}

run_walkthrough() {
  need_cmd git

  local default_deb_url deb_url deb_ver current_pkgver current_pkgrel zst_url
  local do_cn_upload=0 upload_channel="beta" upload_version="" upload_app="sapient-artifice/mage-lab"
  default_deb_url="$(read_pkg_var _magelab_deb_url | sed -e 's/^"//' -e 's/"$//')"

  read -r -p "Upstream .deb URL [${default_deb_url}]: " deb_url
  if [[ -z "$deb_url" ]]; then
    deb_url="$default_deb_url"
  fi
  [[ -n "$deb_url" ]] || die "deb URL cannot be empty"

  current_pkgver="$(read_pkg_var pkgver)"
  current_pkgrel="$(read_pkg_var pkgrel)"
  deb_ver="$(extract_deb_version_from_url "$deb_url" || true)"
  if [[ -z "$deb_ver" ]]; then
    echo "Could not auto-detect version from URL."
    read -r -p "Upstream version [${current_pkgver}]: " deb_ver
    if [[ -z "$deb_ver" ]]; then
      deb_ver="$current_pkgver"
    fi
  fi

  echo "Selected upstream version: $deb_ver"
  echo "Current PKGBUILD version:  ${current_pkgver}-${current_pkgrel}"

  if [[ "$deb_ver" != "$current_pkgver" ]]; then
    if confirm "Update PKGBUILD to pkgver=$deb_ver and reset pkgrel=1?" "Y"; then
      set_pkgbuild_var "pkgver" "$deb_ver" plain
      set_pkgbuild_var "pkgrel" "1" plain
      current_pkgrel="1"
      echo "Updated PKGBUILD to ${deb_ver}-${current_pkgrel}"
    else
      die "walkthrough stopped: pkgver mismatch was not accepted"
    fi
  fi

  if ! confirm "Run prepare step now?" "Y"; then
    die "walkthrough stopped before prepare"
  fi
  if confirm "Upload built pacman package to CrabNebula during prepare?" "Y"; then
    do_cn_upload=1
    if confirm "Is this a beta release channel?" "Y"; then
      upload_channel="beta"
    else
      upload_channel="stable"
    fi
    upload_version="$(read_pkg_var pkgver)"
    read -r -p "Upload app slug [${upload_app}]: " input_upload_app
    if [[ -n "${input_upload_app:-}" ]]; then
      upload_app="$input_upload_app"
    fi
    read -r -p "Upload version [${upload_version}]: " input_upload_version
    if [[ -n "${input_upload_version:-}" ]]; then
      upload_version="$input_upload_version"
    fi
  fi

  if [[ "$do_cn_upload" -eq 1 ]]; then
    run_prepare --deb-url "$deb_url" --upload --upload-app "$upload_app" --upload-version "$upload_version" --upload-channel "$upload_channel"
  else
    run_prepare --deb-url "$deb_url"
  fi

  echo
  echo "Upload the built .pkg.tar.zst to your CDN, then paste the public URL below."
  read -r -p "Hosted .pkg.tar.zst URL: " zst_url
  [[ -n "$zst_url" ]] || die "zst URL cannot be empty"

  if ! confirm "Run finalize, commit, and push to AUR now?" "Y"; then
    die "walkthrough stopped before finalize/push"
  fi
  run_finalize --zst-url "$zst_url" --commit --push

  echo
  echo "Walkthrough complete."
  echo "AUR should update shortly after the push."
}

main() {
  ensure_repo_root

  local cmd="${1:-}"
  case "$cmd" in
    prepare)
      shift
      run_prepare "$@"
      ;;
    finalize)
      shift
      run_finalize "$@"
      ;;
    walkthrough)
      shift
      run_walkthrough "$@"
      ;;
    -h|--help|help)
      usage
      ;;
    *)
      usage
      [[ -n "$cmd" ]] && exit 1
      ;;
  esac
}

main "$@"
