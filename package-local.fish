#!/usr/bin/env fish

#
# DO NOT RUN THIS SCRIPT FROM THE PACKAGING REPO.
# This is intended to be run from a git source checkout of the project.
#

#region TrailingNLSafety
function __trim_1trailing_nl
  cat | gawk 'NR > 1 { printf "\n" } { printf "%s", $0 }'
end

set --local -- filename (status current-filename | __trim_1trailing_nl | string collect --no-trim-newlines);
set -- filename (path resolve -- "$filename" | __trim_1trailing_nl | string collect --no-trim-newlines);
set --local -- filename_base (basename -- "$filename" | __trim_1trailing_nl | string collect --no-trim-newlines);
set --local -- dirname (dirname -- "$filename" | __trim_1trailing_nl | string collect --no-trim-newlines);
set --local -- dirname_base (basename -- "$dirname" | __trim_1trailing_nl | string collect --no-trim-newlines);
set --local -- pkgbase "$dirname_base";
set --local -- pkgbase_varsafe "$(string upper -- "$dirname_base" | __trim_1trailing_nl | LC_ALL=C tr -c 'A-Z0-9' '_')";

functions --erase -- '__trim_1trailing_nl';
#endregion TrailingNLSafety

function package-local \
      --inherit-variable='filename' \
      --inherit-variable='dirname' \
      --inherit-variable='pkgbase' \
      --inherit-variable='pkgbase_varsafe' \
;
  set --local -- __fn__yn "$(status current-function)"__'yes-no';
  function "$__fn__yn"
    argparse \
      --strict-longopts --ignore-unknown --stop-nonopt \
        (fish_opt --short='d' --long='default' --required-val) \
      -- $argv;

    set --local -- choices_str;
    switch "$(string lower -- "$_flag_default")"
      case 'n' 'no' 'false'
        set -- choices_str '(y/N)';
      case '*'
        # The default of the default is 'yes'
        set -- choices_str '(Y/n)';
    end

    set --local -- answer (read --prompt-str="$argv? $choices_str " | string collect --no-trim-newlines);
    switch "$(string lower -- "$answer")"
      case 'n' 'no'
        return 1;
      case 'y' 'yes'
        return 0;
      case '*'
        echo -n -- "$answer";
        return 2;
    end
  end

  set --local -- run_cwd (pwd --physical | gawk 'NR > 1 { printf "\n" } { printf "%s", $0 }' | string collect --no-trim-newlines);

  # Usage ex. :: `package-local --cleanbuild branch=my-branch --nocheck` from a checkout or a subdir therein.
  # Normally the argument would come first or last for convenience, but this parser
  #   accepts any position under the stated no-args-for-makepkg assumption.
  # Every option makepkg(8) accepts, so a typo fails here instead of reaching a
  #   makepkg that would silently ignore it. `argparse` hands back the options it
  #   consumed -- verbatim, values included -- in `$argv_opts`, and the rest in
  #   `$argv`: the coordinate first, then makepkg's trailing `VAR=value` overrides.
  argparse \
    --strict-longopts \
      (fish_opt --short='A' --long='ignorearch') \
      (fish_opt --short='c' --long='clean') \
      (fish_opt --short='C' --long='cleanbuild') \
      (fish_opt --short='d' --long='nodeps') \
      (fish_opt --short='D' --long='dir' --required-val) \
      (fish_opt --short='e' --long='noextract') \
      (fish_opt --short='f' --long='force') \
      (fish_opt --short='g' --long='geninteg') \
      (fish_opt --short='h' --long='help') \
      (fish_opt --short='i' --long='install') \
      (fish_opt --short='L' --long='log') \
      (fish_opt --short='m' --long='nocolor') \
      (fish_opt --short='o' --long='nobuild') \
      (fish_opt --short='p' --required-val) \
      (fish_opt --short='r' --long='rmdeps') \
      (fish_opt --short='R' --long='repackage') \
      (fish_opt --short='s' --long='syncdeps') \
      (fish_opt --short='S' --long='source') \
      (fish_opt --short='V' --long='version') \
      (fish_opt --long='allsource') \
      (fish_opt --long='asdeps') \
      (fish_opt --long='check') \
      (fish_opt --long='config' --required-val) \
      (fish_opt --long='holdver') \
      (fish_opt --long='key' --required-val) \
      (fish_opt --long='noarchive') \
      (fish_opt --long='nocheck') \
      (fish_opt --long='noconfirm') \
      (fish_opt --long='noprepare') \
      (fish_opt --long='noprogressbar') \
      (fish_opt --long='nosign') \
      (fish_opt --long='noverify') \
      (fish_opt --long='needed') \
      (fish_opt --long='packagelist') \
      (fish_opt --long='printsrcinfo') \
      (fish_opt --long='sign') \
      (fish_opt --long='skipchecksums') \
      (fish_opt --long='skipinteg') \
      (fish_opt --long='skippgpcheck') \
      (fish_opt --long='verifysource') \
    -- $argv;
  or return 3;

  set --local -- cleanbuild_used 'false';
  # -C/--cleanbuild should nuke the repo and not tell about 'not a clone'
  #   if the source moved.
  if set --query -- _flag_cleanbuild;
    set -- cleanbuild_used 'true'; end

  if set --query -- _flag_dir
    echo -- "Overriding `-D`/`--dir` is not supported. Aborting." >&2;
    return 3; end

  #region SourceOverrides
  set --local -- coords "$argv[1]"; set -- argv $argv[2..];  # shift 1

  set --local --export -- REPO_PKGBUILD_NAME 'PKGBUILD';
  if test -n "$_flag_p"
    set -- REPO_PKGBUILD_NAME "$_flag_p";
  end
  # set --local --export -- REPO_PACKAGING "$REPO_LOCAL"/.local/packaging;
  set --local --export -- REPO_PACKAGING "$dirname";  # this script lives in the packaging repo now
  # Uses the dir of the current shell ctx :: invoke this script from the actual source repo
  set --local --export -- REPO_LOCAL;
  if not set -- REPO_LOCAL "$(git -C "$run_cwd" rev-parse --show-toplevel 2>/dev/null)"
    echo -- "Not a source checkout. Aborting." >&2; return 1; end

  if test "$REPO_LOCAL" = "$REPO_PACKAGING"
    set --local -- answer ("$__fn__yn" --default='n' 'Are you sure you are not running this from the packaging dir');
    set --local -- __confirmation_status "$status";
    if test "$__confirmation_status" -eq 2
      echo -- "'$answer' is not a valid choice. Valid choices: 'y' or 'n' (default)." >&2;
      return 1;
    end
    if test "$__confirmation_status" -eq 1
      echo -- "Aborting then." >&2;
      return 2;
    end
    
    if not test "$I_DO_KNOW_WHAT_I_AM_DOING" = 'really'
      echo -- "Sike! Wrong choice." >&2;
      echo -- "  script dir ::                         `$REPO_PACKAGING`" >&2;
      echo -- "  and checkout root from your cwd is at `$REPO_LOCAL`." >&2;
      echo >&2;
      echo -- "See `$filename` for more info." >&2;
      return 2;
    end
  end
  
  if test "$REPO_PACKAGING_DEBUG" = '1'
    set -S argv_opts argv cleanbuild_used REPO_PKGBUILD_NAME;
    set -S REPO_PACKAGING pkgbase pkgbase_varsafe;
  end
  
  if {
      "$cleanbuild_used";
  and test -d "$REPO_PACKAGING"/.srcdest/local/"$pkgbase";
  and {
       test -f "$REPO_PACKAGING"/.srcdest/local/"$pkgbase"/HEAD;
    or test -f "$REPO_PACKAGING"/.srcdest/local/"$pkgbase"/FETCH_HEAD; }
  and not test -z "$REPO_PACKAGING";
  and not test "$REPO_PACKAGING" = '/';
  and not test -z "$pkgbase";
  and not test "$pkgbase" = '/';
  }
    # Quite a few precautions against potential bugs in the script.
    set --local -- timeout 5;
    echo -n -- "Removing the previous source clone in `$REPO_PACKAGING/.srcdest/local/$pkgbase` due to `--cleanbuild` passed (Ctrl+C to abort) in";
    for elapsed_ticker in (seq 0 (math -- "$timeout - 1"))
      echo -n -- " $(math -- "$timeout - $elapsed_ticker")";
      sleep 1s;
    end
    echo -n -- \n;

    rm -rf "$REPO_PACKAGING"/.srcdest/local/"$pkgbase";
  end

  test -z "$coords";
    and set --local --export -- REPO_COORDS 'commit=HEAD';
    or set --local --export -- REPO_COORDS "$coords";

  #region SourceOverrides::Remap with fallback
  set --local -- __varname__repo_coords  'REPO_COORDS'__"$pkgbase_varsafe";
  set --local -- __varname__repo_use_ssh 'REPO_USE_SSH'__"$pkgbase_varsafe";
  set --local -- __varname__repo_local   'REPO_LOCAL'__"$pkgbase_varsafe";
  
  not set -q "$__varname__repo_coords";  and set --local --export -- "$__varname__repo_coords"  "$REPO_COORDS";
  not set -q "$__varname__repo_use_ssh"; and set --local --export -- "$__varname__repo_use_ssh" "$REPO_USE_SSH";
  not set -q "$__varname__repo_local";   and set --local --export -- "$__varname__repo_local"   "$REPO_LOCAL";
  #endregion SourceOverrides::Remap
  
  set --local -- __fn__no_source_overrides "$(status current-function)"__'no-source-overrides';
  function "$__fn__no_source_overrides" \
        --no-scope-shadowing \
  ;
    env -u "$__varname__repo_local" -u "$__varname__repo_coords" -u "$__varname__repo_use_ssh" \
      $argv;
  end
  #endregion SourceOverrides
  
  if test "$REPO_PACKAGING_DEBUG" = '1'
    set -S "$__varname__repo_coords" "$__varname__repo_use_ssh" "$__varname__repo_local";
  end

  set --local -- srcdest_published "$REPO_PACKAGING"/.srcdest/published;   # mirrors the published URL
  set --local -- srcdest_local     "$REPO_PACKAGING"/.srcdest/local;       # mirrors your checkout URL

    "$__fn__no_source_overrides" SRCDEST="$srcdest_published" \
      updpkgsums "$REPO_PACKAGING"/"$REPO_PKGBUILD_NAME";
  and env SRCDEST="$srcdest_local" \
      makepkg  -D"$REPO_PACKAGING" -fis $argv_opts $argv;
  and "$__fn__no_source_overrides" \
      makepkg  -D"$REPO_PACKAGING" -p "$REPO_PKGBUILD_NAME" --printsrcinfo $argv > "$REPO_PACKAGING"/.SRCINFO

  functions --erase -- "$__fn__no_source_overrides";
  functions --erase -- "$__fn__yn";
end

# @fish-lsp-disable-next-line 4004
if not { status stack-trace | read --local -- __ }
  set --local -- function_name "$(string replace --regex --max-matches=1 -- '\Q.fish\E$' '' "$filename_base")";
  "$function_name" $argv;
  exit "$status";
  # otherwise the script is not being run directly, presumably we're being sourced
end
