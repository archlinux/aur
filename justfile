PkgBase       := "ceph"
ChrootPath    := env_var("HOME") / "chroot"
ChrootBase    := ChrootPath / "root"
ChrootActive  := ChrootPath / PkgVer + "_" + PkgRel

Color         := env_var_or_default("USE_COLOR", "1")
Chroot        := env_var_or_default("USE_CHROOT", "1")

# Default to listing recipes
_default:
  @just --list --list-prefix '  > '

# Create and update the base chroot
chroot: (_update_chroot ChrootBase)

# Initialize the base chroot for building packages
mkchroot: (_mkchroot ChrootBase)

# Initialize the chroot
@_mkchroot $cbase:
  {{ if path_exists(cbase) == "true" { ":" } else { "$Say Initializing chroot @$cbase" } }}
  {{ if path_exists(cbase) == "true" { ":" } else { "mkarchroot $cbase base-devel" } }}

# Update dependencies in the base chroot
@_update_chroot $cbase: (_mkchroot cbase)
  $Say Updating chroot packages @$cbase
  arch-nspawn $cbase pacman -Syu

# ~~~ Global shell variables ~~~
export Say              := "echo " + C_RED + "==> " + C_RESET + BuildId

# Nicer name for empty strings
None := ""

# ~~~ Contextual information ~~~
PkgBuild                := justfile_directory() / "PKGBUILD"
PkgVer                  := `awk -F= '/pkgver=/ {print $2}' PKGBUILD`
PkgRel                  := `awk -F= '/pkgrel=/ {print $2}' PKGBUILD`
GitCommitish            := if `git tag --points-at HEAD` != None {
                              `git tag --points-at HEAD`
                           } else if `git branch --show-current` != None {
                              `git branch --show-current`
                           } else {
                              `git rev-parse --short HEAD`
                           }
BuildId                 := "[" + C_YELLOW + PkgBase + C_RESET + "/" + C_GREEN + PkgVer + ":" + PkgRel + C_RESET + "@" + C_CYAN + GitCommitish + C_RESET + "]"
BuildTriple             := PkgVer + "-" + PkgRel + "-" + "x86_64"
LogFileList             := env_var_or_default("TEMP", "/tmp") / PkgBase + ".temp" / "logfiles"

# ~~~ Color Codes ~~~
C_ENABLED   := if Color =~ '(?i)^auto|yes|1$' { "1" } else { None }

C_RESET     := if C_ENABLED == "1" { `echo -e "\033[0m"`    } else { None }
C_BLACK     := if C_ENABLED == "1" { `echo -e "\033[0;30m"` } else { None }
C_RED       := if C_ENABLED == "1" { `echo -e "\033[0;31m"` } else { None }
C_GREEN     := if C_ENABLED == "1" { `echo -e "\033[0;32m"` } else { None }
C_YELLOW    := if C_ENABLED == "1" { `echo -e "\033[0;33m"` } else { None }
C_BLUE      := if C_ENABLED == "1" { `echo -e "\033[0;34m"` } else { None }
C_MAGENTA   := if C_ENABLED == "1" { `echo -e "\033[0;35m"` } else { None }
C_CYAN      := if C_ENABLED == "1" { `echo -e "\033[0;36m"` } else { None }
C_WHITE     := if C_ENABLED == "1" { `echo -e "\033[0;37m"` } else { None }
