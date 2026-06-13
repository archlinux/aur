#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./aur-release.sh prepare [--deb-url URL | --deb-file PATH] [--upload [upload options]]
  ./aur-release.sh finalize --zst-url URL [--commit] [--push] [--message MSG]
  ./aur-release.sh walkthrough

Commands:
  prepare   Build package from upstream .deb and update _magelab_deb_* in PKGBUILD.
  finalize  Update _magelab_zst_* in PKGBUILD, refresh .SRCINFO, optionally commit/push.
  walkthrough
            Interactive local-first flow: choose a .deb, build, refresh metadata, commit, and optionally push.

Options:
  --deb-url URL    Override _magelab_deb_url during prepare.
  --deb-file PATH  Use a local .deb during prepare instead of downloading it.
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
                   Release channel for upload (omit for default release channel).
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

commit_release() {
  local commit_msg="$1"

  need_cmd git
  git add PKGBUILD .SRCINFO
  git commit -m "$commit_msg"
  echo "==> Created commit: $commit_msg"
}

push_release() {
  need_cmd git
  # AUR metadata tracks master; push HEAD explicitly there.
  git push origin HEAD:master
  echo "==> Pushed to origin/master"
}

run_prepare() {
  local deb_url=""
  local deb_file=""
  local do_upload=0
  local upload_app="sapient-artifice/mage-lab"
  local upload_version=""
  local upload_platform="pacman-x86_64"
  local upload_file=""
  local upload_signature=""
  local upload_gpg_key=""
  local upload_channel=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --deb-url)
        [[ $# -ge 2 ]] || die "--deb-url requires a value"
        deb_url="$2"
        shift 2
        ;;
      --deb-file)
        [[ $# -ge 2 ]] || die "--deb-file requires a value"
        deb_file="$2"
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

  [[ -z "$deb_url" || -z "$deb_file" ]] || die "use either --deb-url or --deb-file, not both"

  need_cmd makepkg
  need_cmd sha256sum
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

  deb_asset="magelab_${pkgver}_amd64.deb"
  if [[ -n "$deb_file" ]]; then
    [[ -f "$deb_file" ]] || die "local .deb not found: $deb_file"
    echo "==> Using local .deb: $deb_file"
    if [[ "$deb_file" != "$deb_asset" ]]; then
      cp -f "$deb_file" "$deb_asset"
    fi
    deb_source_url="file://${deb_file}"
  else
    need_cmd curl
    deb_source_url="$(read_pkg_var _magelab_deb_url | sed -e 's/^"//' -e 's/"$//')"
    [[ -n "$deb_source_url" ]] || die "_magelab_deb_url is empty"
    echo "==> Downloading $deb_asset"
    curl --fail --location --silent --show-error "$deb_source_url" --output "$deb_asset"
  fi

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
    run_cn_upload "$upload_app" "$upload_version" "$upload_platform" "$upload_file" "$upload_signature" "$upload_gpg_key" "$upload_channel" "$out_pkg"
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

run_cn_upload() {
  local upload_app="$1"
  local upload_version="$2"
  local upload_platform="$3"
  local upload_file="$4"
  local upload_signature="$5"
  local upload_gpg_key="$6"
  local upload_channel="$7"
  local default_upload_file="$8"

  need_cmd cn
  need_cmd gpg

  if [[ -z "$upload_file" ]]; then
    upload_file="$default_upload_file"
  fi
  [[ -f "$upload_file" ]] || die "upload file not found: $upload_file"

  if [[ -z "$upload_signature" ]]; then
    upload_signature="${upload_file}.asc"
    echo "==> Generating signature: $upload_signature"
    local gpg_cmd=(gpg --batch --yes --armor --detach-sign --output "$upload_signature")
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
  )
  if [[ -n "$upload_channel" ]]; then
    upload_cmd+=(--channel "$upload_channel")
  fi
  "${upload_cmd[@]}"
}

run_finalize() {
  local zst_url=""
  local zst_file=""
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
      --zst-file)
        [[ $# -ge 2 ]] || die "--zst-file requires a value"
        zst_file="$2"
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
  if [[ -n "$zst_file" ]]; then
    out_pkg="$zst_file"
  else
    out_pkg="$(pkg_filename)"
  fi

  if [[ -f "$out_pkg" ]]; then
    out_sha="$(sha256sum "$out_pkg" | awk '{print $1}')"
  else
    need_cmd curl
    echo "==> Local package not found; hashing from download URL"
    out_sha="$(curl --fail --location --silent --show-error "$zst_url" | sha256sum | awk '{print $1}')"
  fi
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

    commit_release "$commit_msg"
  fi

  if [[ "$do_push" -eq 1 ]]; then
    push_release
  fi
}

run_walkthrough() {
  need_cmd git

  local default_deb_url recorded_deb_url deb_url deb_file deb_ver current_pkgver current_pkgrel next_pkgrel zst_url
  local upload_channel="beta" upload_version="" upload_app="sapient-artifice/mage-lab"
  local commit_msg="" push_after_commit=0
  local local_debs=()
  default_deb_url="$(read_pkg_var _magelab_deb_url | sed -e 's/^"//' -e 's/"$//')"
  recorded_deb_url="$default_deb_url"
  current_pkgver="$(read_pkg_var pkgver)"
  current_pkgrel="$(read_pkg_var pkgrel)"
  shopt -s nullglob
  local_debs=(magelab_*_amd64.deb)
  shopt -u nullglob

  deb_file=""
  if [[ ${#local_debs[@]} -gt 0 ]]; then
    if [[ ${#local_debs[@]} -gt 1 ]]; then
      printf 'Found local .debs:\n'
      printf '  %s\n' "${local_debs[@]}"
      read -r -p "Local .deb to use [${local_debs[0]}]: " input_deb_file
      if [[ -n "${input_deb_file:-}" ]]; then
        deb_file="$input_deb_file"
      else
        deb_file="${local_debs[0]}"
      fi
    else
      deb_file="${local_debs[0]}"
    fi
    echo "Selected local .deb: ${deb_file}"
    if ! confirm "Use this local .deb for the build?" "Y"; then
      deb_file=""
    fi
  fi

  if [[ -z "$deb_file" ]]; then
    read -r -p "Upstream .deb URL [${default_deb_url}]: " deb_url
    if [[ -z "$deb_url" ]]; then
      deb_url="$default_deb_url"
    fi
    [[ -n "$deb_url" ]] || die "deb URL cannot be empty"
  fi

  if [[ -n "$deb_file" ]]; then
    deb_ver="$(extract_deb_version_from_url "$deb_file" || true)"
  else
    deb_ver="$(extract_deb_version_from_url "$deb_url" || true)"
  fi
  if [[ -z "$deb_ver" ]]; then
    echo "Could not auto-detect version from the selected .deb source."
    read -r -p "Upstream version [${current_pkgver}]: " deb_ver
    if [[ -z "$deb_ver" ]]; then
      deb_ver="$current_pkgver"
    fi
  fi

  echo "Selected upstream version: $deb_ver"
  echo "Current PKGBUILD version:  ${current_pkgver}-${current_pkgrel}"

  if [[ "$deb_ver" != "$current_pkgver" ]]; then
    if confirm "Update PKGBUILD to pkgver=$deb_ver?" "Y"; then
      set_pkgbuild_var "pkgver" "$deb_ver" plain
      echo "Updated PKGBUILD to pkgver=$deb_ver"
    else
      die "walkthrough stopped: pkgver mismatch was not accepted"
    fi
  fi

  if [[ "$deb_ver" != "$current_pkgver" ]]; then
    next_pkgrel="1"
  else
    next_pkgrel="$current_pkgrel"
  fi

  read -r -p "pkgrel [${next_pkgrel}]: " input_pkgrel
  if [[ -n "${input_pkgrel:-}" ]]; then
    next_pkgrel="$input_pkgrel"
  fi
  [[ "$next_pkgrel" =~ ^[0-9]+$ ]] || die "pkgrel must be a positive integer"
  set_pkgbuild_var "pkgrel" "$next_pkgrel" plain
  current_pkgrel="$next_pkgrel"
  echo "Release target: ${deb_ver}-${current_pkgrel}"

  if [[ -f "$(pkg_filename)" ]]; then
    echo "Existing package found: $(pkg_filename)"
    if confirm "Build a fresh .pkg.tar.zst now?" "N"; then
      if [[ -n "$deb_file" ]]; then
        run_prepare --deb-file "$deb_file"
      else
        run_prepare --deb-url "$deb_url"
      fi
    else
      echo "Reusing existing $(pkg_filename)"
    fi
  else
    if confirm "Build the .pkg.tar.zst now?" "Y"; then
      if [[ -n "$deb_file" ]]; then
        run_prepare --deb-file "$deb_file"
      else
        run_prepare --deb-url "$deb_url"
      fi
    else
      echo "Skipping build. You will need an existing CrabNebula download URL for this release."
    fi
  fi

  if [[ -n "$deb_file" ]]; then
    echo
    echo "A public .deb URL is still needed in PKGBUILD for future rebuilds."
    read -r -p "Upstream .deb URL to record [${recorded_deb_url}]: " deb_url
    if [[ -z "$deb_url" ]]; then
      deb_url="$recorded_deb_url"
    fi
    [[ -n "$deb_url" ]] || die "deb URL cannot be empty"
    set_pkgbuild_var "_magelab_deb_url" "$deb_url" double
  fi

  echo
  echo "Package file: $(pkg_filename)"
  if confirm "Add this .pkg.tar.zst to CrabNebula now?" "N"; then
    if confirm "Run the CrabNebula upload from this script?" "N"; then
      if confirm "Is this a beta release channel?" "Y"; then
        upload_channel="beta"
      else
        upload_channel=""
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
      run_cn_upload "$upload_app" "$upload_version" "pacman-x86_64" "" "" "" "$upload_channel" "$(pkg_filename)"
    else
      echo "Upload it in CrabNebula, then continue with the hosted download URL."
    fi
  else
    echo "Skipping upload. Paste the existing CrabNebula download URL below."
  fi

  echo
  read -r -p ".pkg.tar.zst CrabNebula download URL: " zst_url
  [[ -n "$zst_url" ]] || die "zst URL cannot be empty"

  run_finalize --zst-url "$zst_url"

  echo
  if ! confirm "Refresh complete. Are you ready to commit these AUR changes?" "Y"; then
    die "walkthrough stopped before commit"
  fi
  if ! confirm "Create the git commit now?" "Y"; then
    die "walkthrough stopped before commit"
  fi

  commit_msg="magelab-bin: release $(read_pkg_var pkgver)-$(read_pkg_var pkgrel)"
  read -r -p "Commit message [${commit_msg}]: " input_commit_msg
  if [[ -n "${input_commit_msg:-}" ]]; then
    commit_msg="$input_commit_msg"
  fi
  commit_release "$commit_msg"

  echo
  if confirm "Push this commit to the AUR remote now?" "N"; then
    if confirm "Push HEAD to origin/master?" "Y"; then
      push_after_commit=1
    fi
  fi
  if [[ "$push_after_commit" -eq 1 ]]; then
    push_release
  fi

  echo
  echo "Walkthrough complete."
  if [[ "$push_after_commit" -eq 1 ]]; then
    echo "AUR should update shortly after the push."
  else
    echo "Next step: push with git push origin HEAD:master when you are ready."
  fi
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
