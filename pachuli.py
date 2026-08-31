#!/usr/bin/env python3
"""pachuli - Basic AUR Package Helper (Python-Neuimplementierung)

Ein einfacher AUR-Helper zum Suchen, Installieren und Aktualisieren von
AUR-Paketen unter Arch/Manjaro. Kein vollwertiger Paketmanager - für
alles jenseits einfacher AUR-Operationen bitte weiterhin pacman nutzen.

Original: pachuli (Bash-Skript)
Diese Version: vollständige Python-Neuimplementierung mit pacman/yay-artiger
CLI (Operation -S/-R/-Q + stapelbare Modifikatoren, z.B. -Ss, -Syu, -Rns).
"""

from __future__ import annotations

import configparser
import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path

VERSION = "2.1.0"
AUR_ADDR = "https://aur.archlinux.org"
DEFAULT_BUILD_DIR = Path(
    os.environ.get("PACHULI_BUILDDIR", Path.home() / ".cache" / "pachuli" / "builds")
)
CONFIG_PATH = Path(
    os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config")
) / "pachuli" / "config"
HTTP_TIMEOUT = 30


# --------------------------------------------------------------------------
# Terminalfarben / Ausgabe
# --------------------------------------------------------------------------

class Colors:
    RESET = "\033[0m"
    BOLD = "\033[1m"
    RED = "\033[1;31m"
    GREEN = "\033[1;32m"
    YELLOW = "\033[1;33m"
    BLUE = "\033[34m"
    BRIGHT_BLUE = "\033[1;94m"
    WHITE = "\033[1;37m"
    DIM = "\033[2m"

    # feste Zuordnung für die gängigsten Arch-Repos
    REPO_COLORS = {
        "core": "\033[1;36m",      # Cyan
        "extra": "\033[1;35m",     # Magenta
        "multilib": "\033[1;33m",  # Gelb
        "aur": "\033[1;32m",       # Grün
    }
    # Rotation für unbekannte/Drittanbieter-Repos (z.B. chaotic-aur)
    REPO_FALLBACK_COLORS = [
        "\033[1;31m",  # Rot
        "\033[1;34m",  # Blau
        "\033[1;96m",  # Hellcyan
        "\033[1;95m",  # Hellmagenta
        "\033[1;93m",  # Hellgelb
        "\033[1;91m",  # Hellrot
    ]

    @classmethod
    def for_repo(cls, repo: str) -> str:
        """Liefert eine feste, konsistente Farbe für ein Repository.
        Bekannte Repos (core/extra/multilib/aur) haben feste Farben,
        alle anderen erhalten deterministisch eine Farbe aus der
        Rotation (per Hash des Namens, damit sie über mehrere Aufrufe
        hinweg gleich bleibt)."""
        color = cls.REPO_COLORS.get(repo.lower())
        if color:
            return color
        idx = sum(ord(c) for c in repo) % len(cls.REPO_FALLBACK_COLORS)
        return cls.REPO_FALLBACK_COLORS[idx]


class PachuliError(Exception):
    """Wird geworfen, wenn ein Vorgang abgebrochen werden muss."""

    def __init__(self, message: str, code: int = 1):
        super().__init__(message)
        self.code = code


def msg(text: str, color: str | None = None, quiet: bool = False) -> None:
    if quiet:
        return
    if color:
        print(f"{Colors.BOLD}{color}::{Colors.RESET} {Colors.BOLD}{text}{Colors.RESET}")
    else:
        print(text)


def die(text: str, code: int = 1) -> None:
    print(f"{Colors.RED}error:{Colors.RESET} {text}", file=sys.stderr)
    raise PachuliError(text, code)


def yesno(question: str, noconf: bool) -> bool:
    if noconf:
        return True
    try:
        answer = input(f"{Colors.BLUE}::{Colors.RESET} {Colors.BOLD}{question}? [Y/n]{Colors.RESET} ")
    except EOFError:
        return False
    answer = answer.strip()
    return answer == "" or answer.lower() == "y"


def find_editor() -> str | None:
    """Ermittelt einen tatsächlich verfügbaren Editor.

    Prüft zunächst $EDITOR bzw. $VISUAL, verwendet diese aber nur, wenn
    das darin genannte Programm auch wirklich installiert ist (per
    shutil.which). Andernfalls wird eine Liste gängiger Editoren
    durchprobiert. Gibt None zurück, wenn nichts gefunden wurde."""
    for var in ("EDITOR", "VISUAL"):
        candidate = os.environ.get(var)
        if candidate and shutil.which(candidate.split()[0]):
            return candidate
    for candidate in ("nano", "vim", "vi", "nvim", "micro"):
        if shutil.which(candidate):
            return candidate
    return None


def validate_pkg_name(pkg: str) -> str:
    """Stellt sicher, dass ein Paketname keine Pfad-Traversal oder
    Shell-Sonderzeichen enthält, bevor er zum Bauen eines Pfades
    (builddir / pkg) oder eines Subprocess-Arguments verwendet wird.
    Pacman-Paketnamen bestehen laut Namenskonvention nur aus
    Kleinbuchstaben, Ziffern und @.,_+- ; wir sind hier etwas
    großzügiger (auch Großbuchstaben erlaubt), aber blocken klar
    gefährliche Zeichen wie '/', '..', Leerzeichen, Shell-Metazeichen."""
    if not pkg or not re.match(r"^[\w.+-]+$", pkg) or ".." in pkg:
        die(f"ungültiger Paketname: '{pkg}'")
    return pkg


def parse_selection(text: str, count: int) -> set[int]:
    """Parst eine yay-artige Nummernauswahl aus einem Suchergebnis-Prompt.

    Unterstützt (jeweils durch Leerzeichen oder Kommas getrennt):
      - einzelne Nummern:        "1 3 5"
      - Bereiche:                "1-3"
      - Ausschlüsse (^):         "^4"          -> alles außer 4
      - Kombinationen:           "1-6 ^3"      -> 1-6 ohne 3
      - "all"                    -> alle Treffer
      - leere Eingabe            -> keine Auswahl (Abbruch für diese Suche)
    """
    text = text.strip()
    if not text:
        return set()
    if text.lower() == "all":
        return set(range(1, count + 1))

    include: set[int] = set()
    exclude: set[int] = set()
    for tok in re.split(r"[\s,]+", text):
        if not tok:
            continue
        negate = tok.startswith("^")
        if negate:
            tok = tok[1:]
        target = exclude if negate else include
        if "-" in tok:
            a, _, b = tok.partition("-")
            try:
                a_i, b_i = int(a), int(b)
            except ValueError:
                continue
            lo, hi = min(a_i, b_i), max(a_i, b_i)
            target.update(range(lo, hi + 1))
        else:
            try:
                target.add(int(tok))
            except ValueError:
                continue

    if not include and exclude:
        # Nur Ausschlüsse angegeben (z.B. nur "^3") -> Basis ist "alle"
        include = set(range(1, count + 1))

    return {n for n in (include - exclude) if 1 <= n <= count}


# --------------------------------------------------------------------------
# Konfiguration
# --------------------------------------------------------------------------

def load_config() -> dict:
    """Lädt optionale Standardwerte aus ~/.config/pachuli/config
    (bzw. $XDG_CONFIG_HOME/pachuli/config), INI-Format, Abschnitt
    [pachuli]. CLI-Argumente haben immer Vorrang vor der Konfigdatei,
    die Konfigdatei wiederum vor den eingebauten Standardwerten.

    Beispiel-Inhalt:

        [pachuli]
        noconfirm = false
        quiet = false
        builddir = ~/.cache/pachuli/builds
    """
    cfg: dict = {}
    if not CONFIG_PATH.is_file():
        return cfg
    parser = configparser.ConfigParser()
    try:
        parser.read(CONFIG_PATH)
    except configparser.Error as exc:
        print(f"{Colors.YELLOW}warning:{Colors.RESET} Konfigurationsdatei "
              f"{CONFIG_PATH} fehlerhaft, wird ignoriert: {exc}", file=sys.stderr)
        return cfg
    if "pachuli" not in parser:
        return cfg
    section = parser["pachuli"]
    for key in ("auronly", "noconfirm", "noview", "gui", "debug", "quiet", "devel", "cleanbuild"):
        if key in section:
            try:
                cfg[key] = section.getboolean(key)
            except ValueError:
                print(f"{Colors.YELLOW}warning:{Colors.RESET} ungültiger Wert für "
                      f"'{key}' in {CONFIG_PATH}, wird ignoriert", file=sys.stderr)
    if "builddir" in section:
        cfg["builddir"] = Path(section["builddir"]).expanduser()
    return cfg


@dataclass
class Options:
    auronly: bool = False
    noconfirm: bool = False
    noview: bool = True
    gui: bool = False
    debug: bool = False
    quiet: bool = False
    devel: bool = False
    cleanbuild: bool = False
    builddir: Path = field(default_factory=lambda: DEFAULT_BUILD_DIR)
    refresh: int = 0  # 0 = kein Sync (-Su), 1 = -Sy, 2+ = -Syy (erzwungen)

    def sync_flags(self, upgrade: bool) -> str | None:
        """Baut die pacman-Sync/Upgrade-Flags passend zum angegebenen
        y-Level (siehe `refresh`), pacman-treu:
          refresh=0            -> kein automatischer Datenbank-Sync
          refresh=1 (-Sy)      -> normaler Sync (nur falls veraltet)
          refresh>=2 (-Syy)    -> erzwungener Sync, auch wenn aktuell
        `upgrade=True` hängt zusätzlich 'u' an. Gibt None zurück, wenn
        weder Sync noch Upgrade nötig ist (nichts zu tun)."""
        flags = "-S"
        if self.refresh >= 2:
            flags += "yy"
        elif self.refresh == 1:
            flags += "y"
        if upgrade:
            flags += "u"
        return None if flags == "-S" else flags


# --------------------------------------------------------------------------
# Privilegien-Eskalation
# --------------------------------------------------------------------------

def escalate(cmd: list[str], opts: Options) -> subprocess.CompletedProcess:
    """Führt cmd mit erhöhten Rechten aus (pkexec/sudo/doas/su als Fallback)."""
    if opts.gui and shutil.which("pkexec"):
        full_cmd = ["pkexec", *cmd]
    elif shutil.which("sudo"):
        full_cmd = ["sudo", *cmd]
    elif shutil.which("doas"):
        full_cmd = ["doas", *cmd]
    else:
        full_cmd = ["su", "-c", shlex.join(cmd)]
    return subprocess.run(full_cmd)


def run(cmd: list[str], **kwargs) -> subprocess.CompletedProcess:
    if kwargs.pop("capture", False):
        return subprocess.run(cmd, capture_output=True, text=True, **kwargs)
    return subprocess.run(cmd, **kwargs)


# --------------------------------------------------------------------------
# AUR RPC Client
# --------------------------------------------------------------------------

class AurClient:
    """Kleiner Client für die AUR RPC v5 API (ersetzt die curl-Aufrufe)."""

    def __init__(self, base_url: str = AUR_ADDR, timeout: int = HTTP_TIMEOUT):
        self.base_url = base_url
        self.timeout = timeout

    def _get_json(self, path: str) -> dict | None:
        url = f"{self.base_url}{path}"
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "pachuli-python"})
            with urllib.request.urlopen(req, timeout=self.timeout) as resp:
                return json.loads(resp.read().decode("utf-8", errors="replace"))
        except (urllib.error.URLError, TimeoutError, json.JSONDecodeError):
            return None

    def search(self, query: str) -> list[dict]:
        data = self._get_json(f"/rpc/v5/search/{urllib.parse.quote(query)}")
        if not data or data.get("resultcount", 0) == 0:
            return []
        return data.get("results", [])

    def info(self, packages: list[str]) -> list[dict]:
        if not packages:
            return []
        qs = "&".join(f"arg[]={urllib.parse.quote(p)}" for p in packages)
        data = self._get_json(f"/rpc/v5/info?{qs}")
        if not data:
            return []
        return data.get("results", [])

    def exists(self, package: str) -> bool:
        data = self._get_json(f"/rpc/v5/info?arg[]={urllib.parse.quote(package)}")
        return bool(data and data.get("resultcount", 0) > 0)


# --------------------------------------------------------------------------
# vercmp (nutzt das echte pacman-Werkzeug, sofern verfügbar)
# --------------------------------------------------------------------------

def vercmp(v1: str, v2: str) -> int:
    """Vergleicht zwei Paketversionen wie `vercmp`. Fällt auf eine simple
    Näherung zurück, falls das Systemwerkzeug fehlt."""
    if shutil.which("vercmp"):
        result = subprocess.run(["vercmp", v1, v2], capture_output=True, text=True)
        try:
            return int(result.stdout.strip())
        except ValueError:
            pass
    # einfacher Fallback: Token-weiser Vergleich
    def tokens(v: str) -> list:
        return re.findall(r"\d+|[A-Za-z]+", v)

    t1, t2 = tokens(v1), tokens(v2)
    for a, b in zip(t1, t2):
        if a.isdigit() and b.isdigit():
            a, b = int(a), int(b)
        if a != b:
            return -1 if a < b else 1
    return (len(t1) > len(t2)) - (len(t1) < len(t2))


def search_sync_repos(query: str) -> list[dict]:
    """Durchsucht alle in pacman.conf aktivierten Sync-Repos (core, extra,
    multilib, ggf. eigene/Drittanbieter-Repos) mittels `pacman -Ss`.

    Gibt eine Liste von Dicts im selben Format wie AurClient.search()
    zurück (Name, Version, Description, Repository), damit beide
    Quellen einheitlich verarbeitet werden können."""
    result = subprocess.run(
        ["pacman", "-Ss", query], capture_output=True, text=True
    )
    if result.returncode != 0 or not result.stdout:
        return []

    entries: list[dict] = []
    lines = result.stdout.splitlines()
    i = 0
    header_re = re.compile(r"^([^/\s]+)/(\S+)\s+(\S+)")
    while i < len(lines):
        m = header_re.match(lines[i])
        if m:
            repo, name, version = m.group(1), m.group(2), m.group(3)
            desc = ""
            if i + 1 < len(lines) and lines[i + 1].startswith(("    ", "\t")):
                desc = lines[i + 1].strip()
                i += 1
            entries.append({
                "Name": name,
                "Version": version,
                "Description": desc,
                "Repository": repo,
                "Popularity": 0.0,
                "OutOfDate": None,
            })
        i += 1
    return entries


# --------------------------------------------------------------------------
# Paket-Klassifizierung (Repo vs. AUR)
# --------------------------------------------------------------------------

def classify_packages(names: list[str]) -> tuple[list[str], list[str]]:
    """Sortiert Paketnamen in (Repo-Pakete, AUR-Kandidaten).

    Nutzt `pacman -Si <name>` (exakte Sync-DB-Abfrage nach Paketname) statt
    einer `-Ss`-Regex-Suche: Letztere matcht auch gegen Beschreibungstexte
    und liefert bei verankerten Mustern wie "^pikaur$" unter Umständen
    trotzdem "pikaur-git" zurück, was zu Fehlklassifizierungen führt.

    Fragt alle Namen in EINEM `pacman -Si`-Aufruf ab statt pro Paket
    einen eigenen Subprozess zu starten - deutlich schneller bei
    mehreren Paketen. `pacman -Si` gibt einen Exit-Code != 0 zurück,
    sobald auch nur ein Name unbekannt ist, druckt aber trotzdem für
    alle bekannten Namen einen Info-Block auf stdout - deshalb wird
    hier über den Namen im Info-Block ausgewertet statt über den
    Returncode."""
    if not names:
        return [], []
    result = subprocess.run(
        ["pacman", "-Si", *names],
        capture_output=True, text=True,
    )
    found = set(re.findall(r"^Name\s*:\s*(\S+)", result.stdout, re.MULTILINE))
    repo_pkgs = [n for n in names if n in found]
    aur_pkgs = [n for n in names if n not in found]
    return repo_pkgs, aur_pkgs


def installed_foreign_packages() -> list[str]:
    """Entspricht `pacman -Qqm` (alle nicht in Repos befindlichen, also
    vermutlich AUR-Pakete)."""
    result = subprocess.run(["pacman", "-Qqm"], capture_output=True, text=True)
    if result.returncode != 0:
        return []
    return [line for line in result.stdout.splitlines() if line.strip()]


def installed_versions_all() -> dict[str, str]:
    """Alle lokal installierten Pakete mit Version (entspricht `pacman -Q`
    ohne Argumente), unabhängig davon ob Repo- oder Fremd-/AUR-Paket.
    Wird für die 'installiert'-Markierung in den Suchergebnissen genutzt."""
    result = subprocess.run(["pacman", "-Q"], capture_output=True, text=True)
    if result.returncode != 0:
        return {}
    versions: dict[str, str] = {}
    for line in result.stdout.splitlines():
        parts = line.split()
        if len(parts) == 2:
            versions[parts[0]] = parts[1]
    return versions


# --------------------------------------------------------------------------
# Kernoperationen
# --------------------------------------------------------------------------

def rank_results(results: list[dict], query: str) -> list[dict]:
    """Sortiert AUR-Suchergebnisse nach Relevanz zur Suchanfrage.

    Reihenfolge:
      0 = Name entspricht exakt der Anfrage (z.B. "pikaur" -> "pikaur")
      1 = Name beginnt mit der Anfrage (z.B. "pikaur-git")
      2 = Anfrage kommt irgendwo im Namen vor
      3 = Anfrage kommt nur in der Beschreibung vor
      4 = alles andere (z.B. Treffer nur wegen Provides o.ä.)
    Innerhalb einer Gruppe wird nach Popularität absteigend sortiert."""
    q = query.strip().lower()

    def rank(entry: dict) -> tuple[int, float]:
        name = (entry.get("Name") or "").lower()
        desc = (entry.get("Description") or "").lower()
        popularity = entry.get("Popularity") or 0.0
        if name == q:
            group = 0
        elif name.startswith(q):
            group = 1
        elif q in name:
            group = 2
        elif q in desc:
            group = 3
        else:
            group = 4
        return (group, -popularity)

    return sorted(results, key=rank)


def colorize_diff(diff_text: str) -> str:
    """Färbt ein unified-diff für die Terminalausgabe ein (grün=hinzugefügt,
    rot=entfernt, blau=Hunk-Header)."""
    lines = []
    for line in diff_text.splitlines():
        if line.startswith("+") and not line.startswith("+++"):
            lines.append(f"{Colors.GREEN}{line}{Colors.RESET}")
        elif line.startswith("-") and not line.startswith("---"):
            lines.append(f"{Colors.RED}{line}{Colors.RESET}")
        elif line.startswith("@@"):
            lines.append(f"{Colors.BRIGHT_BLUE}{line}{Colors.RESET}")
        else:
            lines.append(line)
    return "\n".join(lines)


DEVEL_SUFFIXES = ("-git", "-svn", "-hg", "-bzr", "-cvs", "-darcs")


def is_devel_package(name: str) -> bool:
    """Erkennt VCS-/Devel-Pakete (z.B. "pikaur-git") an ihrem Namenssuffix.
    Solche Pakete haben oft über lange Zeit dieselbe Versionsnummer im
    AUR-Metadatenindex, obwohl der Upstream-Quellcode sich längst
    weiterentwickelt hat - ein reiner Versionsvergleich erkennt hier
    keine Updates."""
    return name.lower().endswith(DEVEL_SUFFIXES)


LOG_PATH = Path(
    os.environ.get("XDG_STATE_HOME", Path.home() / ".local" / "state")
) / "pachuli" / "build-errors.log"


def log_failed_build(pkg: str, cmd: list[str]) -> None:
    """Hängt einen Eintrag über einen fehlgeschlagenen Build an
    ~/.local/state/pachuli/build-errors.log an (bzw. $XDG_STATE_HOME).
    Rein informativ für spätere Fehlersuche - Schreibfehler werden
    bewusst ignoriert, damit die Log-Funktion selbst nie einen sonst
    erfolgreichen/ordentlich abgebrochenen Lauf stören kann."""
    try:
        LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        with LOG_PATH.open("a", encoding="utf-8") as f:
            f.write(f"[{timestamp}] Build fehlgeschlagen: {pkg} (Befehl: {shlex.join(cmd)})\n")
    except OSError:
        pass


# --------------------------------------------------------------------------
# Shell-Completion (bash/zsh/fish) - eingebettet, damit dieses eine
# Skript ohne Zusatzdateien alles Nötige mitbringt.
# --------------------------------------------------------------------------

BASH_COMPLETION = """\
# Bash-Completion für pachuli (pacman/yay-artige Syntax)
_pachuli() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts="-S -Ss -Su -Syu -Syyu -Si -Sc -Scc -R -Rn -Rns -Q -Qu -Qi -Qii \\
          -Y -Yc \\
          -a --aur-only -v --view -N --noconfirm -g --gui \\
          -d --debug -q --quiet --devel --cleanbuild --builddir \\
          --version -h --help"

    case "$prev" in
        --builddir)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return 0
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return 0
    fi

    for w in "${COMP_WORDS[@]}"; do
        if [[ "$w" == -R* ]]; then
            COMPREPLY=( $(compgen -W "$(pacman -Qq 2>/dev/null)" -- "$cur") )
            return 0
        fi
    done
}

complete -F _pachuli pachuli
complete -F _pachuli pachuli.py
"""

ZSH_COMPLETION = """\
#compdef pachuli pachuli.py
_pachuli() {
    local -a opts
    opts=(
        '(-S)-S[Sync: Pakete suchen/installieren/aktualisieren/Info/Cache]'
        '(-R)-R[Remove: Pakete entfernen]'
        '(-Q)-Q[Query: mit u Updates, mit i/ii Paketinfo]'
        '(-Y)-Y[Yay-artig: mit c verwaiste Abhängigkeiten entfernen]'
        '(-a --aur-only)'{-a,--aur-only}'[Nur AUR-Pakete berücksichtigen]'
        '(-v --view)'{-v,--view}'[PKGBUILD zur Ansicht anzeigen]'
        '(-N --noconfirm)'{-N,--noconfirm}'[Keine Rückfragen stellen]'
        '(-g --gui)'{-g,--gui}'[pkexec statt sudo/doas nutzen]'
        '(-d --debug)'{-d,--debug}'[Debug-Ausgabe aktivieren]'
        '(-q --quiet)'{-q,--quiet}'[Statusmeldungen unterdrücken / bei -Qu nur Zahlen]'
        '--devel[Devel-/VCS-Pakete auf neue Commits prüfen (mit -Su)]'
        '--cleanbuild[Sauberen Build erzwingen (makepkg -C)]'
        '--builddir[Build-Verzeichnis]:Verzeichnis:_directories'
        '--version[Version anzeigen]'
        '(- *)'{-h,--help}'[Hilfe anzeigen]'
        '*:Paket:->packages'
    )

    _arguments -s $opts

    case "$state" in
        packages)
            if [[ "${words[*]}" == *"-R"* ]]; then
                compadd -- $(pacman -Qq 2>/dev/null)
            fi
            ;;
    esac
}

_pachuli "$@"
"""

FISH_COMPLETION = """\
# Fish-Completion für pachuli (pacman/yay-artige Syntax)
complete -c pachuli -o S -d 'Sync: Pakete suchen/installieren/aktualisieren'
complete -c pachuli -o Ss -d 'AUR und Repos durchsuchen'
complete -c pachuli -o Su -d 'Auf Updates prüfen (ohne DB-Refresh)'
complete -c pachuli -o Syu -d 'Auf Updates prüfen (mit DB-Refresh)'
complete -c pachuli -o Syyu -d 'Auf Updates prüfen (DB-Refresh erzwungen)'
complete -c pachuli -o Si -d 'Sync-/AUR-Info zu Paketen anzeigen'
complete -c pachuli -o Sc -d 'Paket-Cache leeren (nicht mehr installierte Versionen)'
complete -c pachuli -o Scc -d 'Paket-Cache komplett leeren'
complete -c pachuli -o R -d 'Pakete entfernen'
complete -c pachuli -o Rns -d 'Pakete inkl. Konfigurationsdateien entfernen'
complete -c pachuli -o Q -d 'Query (u=Updates, i/ii=Paketinfo)'
complete -c pachuli -o Qu -d 'Anzahl/Liste verfügbarer Updates ausgeben'
complete -c pachuli -o Qi -d 'Detailinfos zu installierten Paketen'
complete -c pachuli -o Qii -d 'wie -Qi, zusätzlich Backup-Dateien'
complete -c pachuli -o Y -d 'Yay-artige Zusatzfunktionen'
complete -c pachuli -o Yc -d 'Verwaiste Abhängigkeiten entfernen'
complete -c pachuli -s a -l aur-only -d 'Nur AUR-Pakete berücksichtigen'
complete -c pachuli -s v -l view -d 'PKGBUILD zur Ansicht anzeigen'
complete -c pachuli -s N -l noconfirm -d 'Keine Rückfragen stellen'
complete -c pachuli -s g -l gui -d 'pkexec statt sudo/doas nutzen'
complete -c pachuli -s d -l debug -d 'Debug-Ausgabe aktivieren'
complete -c pachuli -s q -l quiet -d 'Statusmeldungen unterdrücken / bei -Qu nur Zahlen'
complete -c pachuli -l devel -d 'Devel-/VCS-Pakete auf neue Commits prüfen (mit -Su)'
complete -c pachuli -l cleanbuild -d 'Sauberen Build erzwingen (makepkg -C)'
complete -c pachuli -l builddir -d 'Build-Verzeichnis' -r -a '(__fish_complete_directories)'
complete -c pachuli -l version -d 'Version anzeigen'

complete -c pachuli -n '__fish_seen_argument -o R' -a '(pacman -Qq 2>/dev/null)'
"""


def _completion_targets() -> dict[str, tuple[list[Path], Path, str]]:
    """Für jede Shell: (Liste bekannter Orte, an denen eine Completion
    schon vorhanden sein könnte - system- oder nutzerweit -, Zielpfad
    für die automatische Installation, Dateiinhalt)."""
    xdg_data = Path(os.environ.get("XDG_DATA_HOME", Path.home() / ".local" / "share"))
    xdg_config = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    bash_user = xdg_data / "bash-completion" / "completions" / "pachuli"
    zsh_user = xdg_data / "zsh" / "site-functions" / "_pachuli"
    fish_user = xdg_config / "fish" / "completions" / "pachuli.fish"
    return {
        "bash": (
            [Path("/usr/share/bash-completion/completions/pachuli"),
             Path("/etc/bash_completion.d/pachuli"), bash_user],
            bash_user, BASH_COMPLETION,
        ),
        "zsh": (
            [Path("/usr/share/zsh/site-functions/_pachuli"), zsh_user],
            zsh_user, ZSH_COMPLETION,
        ),
        "fish": (
            [Path("/usr/share/fish/vendor_completions.d/pachuli.fish"), fish_user],
            fish_user, FISH_COMPLETION,
        ),
    }


def ensure_completions_installed(quiet: bool = False) -> None:
    """Prüft für bash/zsh/fish, ob bereits eine Completion-Datei für
    pachuli existiert (system- oder nutzerweit), und installiert sie
    andernfalls automatisch im Benutzerverzeichnis (kein root nötig,
    schreibt nur unter $XDG_DATA_HOME bzw. $XDG_CONFIG_HOME). Bereits
    vorhandene Dateien werden nie überschrieben. Schreibfehler (z.B.
    kein Speicherplatz, fehlende Rechte) werden pro Shell einzeln
    ignoriert, damit ein Problem bei einer Shell nicht den Rest oder
    den eigentlichen Programmlauf blockiert."""
    installed = []
    for shell, (known_paths, install_path, content) in _completion_targets().items():
        if any(p.is_file() for p in known_paths):
            continue
        try:
            install_path.parent.mkdir(parents=True, exist_ok=True)
            install_path.write_text(content, encoding="utf-8")
            installed.append(f"{shell} -> {install_path}")
        except OSError:
            continue
    if installed and not quiet:
        msg(
            "Shell-Completion automatisch installiert:\n    "
            + "\n    ".join(installed)
            + "\n  (neue Shell starten bzw. Konfiguration neu laden, damit sie wirkt)",
            Colors.BLUE, quiet,
        )


class Pachuli:
    def __init__(self, opts: Options):
        self.opts = opts
        self.aur = AurClient()
        self.opts.builddir.mkdir(parents=True, exist_ok=True)
        self._build_stack: list[str] = []  # geordnet, gegen Abhängigkeitszyklen

    # -- PKGBUILD ansehen --------------------------------------------------

    def view_pkgbuild(self, pkg: str) -> bool:
        """Zeigt das PKGBUILD zur Ansicht/Bearbeitung an, sofern gewünscht.
        Gibt True zurück, wenn der Build fortgesetzt werden soll."""
        if self.opts.noview:
            return True
        if not yesno(f"View/Edit the PKGBUILD for {pkg}", self.opts.noconfirm):
            return True
        pkgbuild = self.opts.builddir / pkg / "PKGBUILD"
        editor = find_editor()
        if editor is None:
            print("Kein Editor gefunden (EDITOR/VISUAL nicht gesetzt und "
                  "keiner der Standard-Editoren installiert). "
                  "Überspringe PKGBUILD-Ansicht.", file=sys.stderr)
            return True
        subprocess.run([editor, str(pkgbuild)])
        subprocess.run(
            ["makepkg", "--printsrcinfo"],
            cwd=self.opts.builddir / pkg,
            stdout=open(self.opts.builddir / pkg / ".SRCINFO", "w"),
        )
        return False

    # -- PGP-Schlüssel -------------------------------------------------

    def import_keys(self, keys: list[str]) -> None:
        for key in keys:
            key = key.strip()
            if not key:
                continue
            check = subprocess.run(
                ["pacman-key", "--list-keys"], capture_output=True, text=True
            )
            if key in check.stdout:
                continue
            msg(f"Resolving missing pgp key: {key}", Colors.YELLOW, self.opts.quiet)
            ok = (
                escalate(["pacman-key", "--recv-keys", key], self.opts).returncode == 0
                and escalate(["pacman-key", "--finger", key], self.opts).returncode == 0
                and escalate(["pacman-key", "--lsign-key", key], self.opts).returncode == 0
            )
            if not ok:
                msg("Failed to import pgp key, continuing anyway", Colors.YELLOW, self.opts.quiet)

    # -- Abhängigkeiten --------------------------------------------------

    def resolve_deps(self, deps: list[str], pkg_context: str) -> None:
        for dep in deps:
            dep_name = re.sub(r"[=<>]=?[0-9.\-]*.*", "", dep)
            # Exakte Namensabfragen statt -Qs/-Ss-Regex-Suche: letztere matcht
            # auch gegen Beschreibungstexte und kann selbst mit verankertem
            # Muster ("^name$") fälschlich ein anders benanntes Paket treffen.
            has_local = subprocess.run(
                ["pacman", "-Qi", dep_name],
                capture_output=True,
            ).returncode == 0
            has_repo = subprocess.run(
                ["pacman", "-Si", dep_name],
                capture_output=True,
            ).returncode == 0
            if not has_local and not has_repo:
                if dep_name in self._build_stack:
                    die(
                        f"Abhängigkeitszyklus erkannt: '{dep_name}' hängt "
                        f"(direkt oder indirekt) von sich selbst ab "
                        f"(aktuelle Kette: {' -> '.join(self._build_stack)} -> {dep_name})."
                    )
                msg(f"Resolving {pkg_context} AUR dependency: {dep_name}", Colors.YELLOW, self.opts.quiet)
                if not self.get(dep_name):
                    die(f"failed to build dependency {dep_name}")

    # -- Bauen -------------------------------------------------------------

    def parse_srcinfo(self, pkg: str) -> dict[str, list[str]]:
        srcinfo_path = self.opts.builddir / pkg / ".SRCINFO"
        result = {"depends": [], "makedepends": [], "validpgpkeys": []}
        if not srcinfo_path.exists():
            subprocess.run(
                ["makepkg", "--printsrcinfo"],
                cwd=self.opts.builddir / pkg,
                stdout=open(srcinfo_path, "w"),
            )
        for line in srcinfo_path.read_text().splitlines():
            line = line.strip()
            for key in result:
                if line.startswith(f"{key} = "):
                    result[key].append(line.split(" = ", 1)[1])
        return result

    def build(self, pkg: str) -> bool:
        pkg_dir = self.opts.builddir / pkg
        if not pkg_dir.is_dir():
            die(f"failed to cd {pkg_dir}")

        srcinfo = self.parse_srcinfo(pkg)
        self.import_keys(srcinfo["validpgpkeys"])
        self.resolve_deps(srcinfo["depends"] + srcinfo["makedepends"], pkg)

        makepkg_cmd = ["makepkg", "-scr"]
        if self.opts.cleanbuild:
            # -C/--cleanbuild: $srcdir wird vor dem Bauen komplett entfernt,
            # sodass wirklich frisch aus den Quellen gebaut wird (keine
            # Reste von vorherigen fehlgeschlagenen oder alten Builds).
            makepkg_cmd.append("-C")
        result = subprocess.run(makepkg_cmd, cwd=pkg_dir)
        if result.returncode != 0:
            log_failed_build(pkg, makepkg_cmd)
            return False

        # `makepkg --packagelist` liefert die exakten, tatsächlich gebauten
        # Paketdateien (inkl. korrektem PKGEXT und ALLER pkgname-Einträge
        # bei Split-Paketen) - zuverlässiger als ein geratener Glob wie
        # "{pkg}*.pkg.tar.zst", der bei anderem PKGEXT (z.B. .xz) oder
        # Split-Paketen (mehrere pkgname in einem PKGBUILD) leerläuft.
        listing = subprocess.run(
            ["makepkg", "--packagelist"], cwd=pkg_dir, capture_output=True, text=True,
        )
        pkg_files = [Path(p) for p in listing.stdout.splitlines() if p.strip() and Path(p).is_file()]
        if not pkg_files:
            # Fallback, falls --packagelist aus irgendeinem Grund nichts
            # Verwertbares liefert (z.B. sehr altes makepkg)
            pkg_files = list(pkg_dir.glob(f"{pkg}*.pkg.tar.*"))
        if not pkg_files:
            msg("makepkg meldete Erfolg, aber kein Paketartefakt gefunden", Colors.YELLOW, self.opts.quiet)
            log_failed_build(pkg, makepkg_cmd + ["# kein Paketartefakt gefunden"])
            return False

        install_cmd = ["pacman", "-U", *[str(p) for p in pkg_files], "--needed"]
        if self.opts.noconfirm:
            install_cmd.append("--noconfirm")
        escalate(install_cmd, self.opts)

        for tarball in pkg_dir.glob("*.tar.*"):
            tarball.unlink(missing_ok=True)
        return True

    # -- Holen/Klonen --------------------------------------------------

    def _fetch_or_clone(self, pkg: str, pkg_dir: Path) -> None:
        """Lädt/aktualisiert das AUR-Git-Repo für `pkg`.

        Ist bereits ein Klon von einem früheren Lauf vorhanden, wird nur
        `git fetch` gemacht und der PKGBUILD-Diff zur vorherigen Version
        angezeigt (statt jedes Mal komplett neu zu klonen). Das spart Zeit
        UND gibt dir die Chance, verdächtige Änderungen zu bemerken, auch
        wenn -n/--no-view (Standard) aktiv ist. Ohne vorhandenen Klon oder
        ohne git wird wie bisher frisch geklont bzw. als tar.gz geladen."""
        has_git = shutil.which("git")
        is_existing_repo = has_git and (pkg_dir / ".git").is_dir()

        if is_existing_repo:
            msg(f"Checking {pkg} for updates...", Colors.BLUE, self.opts.quiet)
            subprocess.run(["git", "fetch", "-q"], cwd=pkg_dir)
            diff = subprocess.run(
                ["git", "diff", "HEAD..FETCH_HEAD", "--", "PKGBUILD"],
                cwd=pkg_dir, capture_output=True, text=True,
            ).stdout
            if diff.strip():
                msg(f"PKGBUILD-Änderungen für {pkg} seit dem letzten Build:", Colors.YELLOW, self.opts.quiet)
                print(colorize_diff(diff))
                if not yesno(f"Diese PKGBUILD-Änderungen für {pkg} akzeptieren", self.opts.noconfirm):
                    die(f"Abgebrochen: PKGBUILD-Änderungen für '{pkg}' nicht akzeptiert")
            else:
                msg(f"Keine PKGBUILD-Änderungen für {pkg}", quiet=self.opts.quiet)
            subprocess.run(["git", "reset", "-q", "--hard", "FETCH_HEAD"], cwd=pkg_dir)
            subprocess.run(["git", "clean", "-q", "-fdx"], cwd=pkg_dir)
            return

        shutil.rmtree(pkg_dir, ignore_errors=True)
        if has_git:
            msg(f"Cloning {pkg} package repo...", Colors.BLUE, self.opts.quiet)
            result = subprocess.run(
                ["git", "clone", f"{AUR_ADDR}/{pkg}.git"], cwd=self.opts.builddir
            )
            if result.returncode != 0:
                die(f"failed to clone package repo: {AUR_ADDR}/{pkg}.git")
        else:
            msg(f"Retrieving package archive: {pkg}", Colors.BLUE, self.opts.quiet)
            tarball_url = f"{AUR_ADDR}/cgit/aur.git/snapshot/{pkg}.tar.gz"
            tarball_path = self.opts.builddir / f"{pkg}.tar.gz"
            try:
                urllib.request.urlretrieve(tarball_url, tarball_path)
            except urllib.error.URLError:
                die(f"failed to download package: {pkg}")
            result = subprocess.run(["tar", "-xvf", str(tarball_path)], cwd=self.opts.builddir)
            if result.returncode != 0:
                die(f"failed to extract package or not a tar.gz archive: {pkg}")
            tarball_path.unlink(missing_ok=True)

    def get_pkgbuild_text(self, pkg: str) -> str:
        """Lädt das PKGBUILD für `pkg` aus dem AUR und gibt seinen Inhalt
        zurück, ohne es zu bauen oder zu installieren (kein Root nötig).
        Läuft komplett in einem eigenen Wegwerf-Temp-Verzeichnis, rührt
        also den normalen Build-Cache unter self.opts.builddir nicht an."""
        pkg = validate_pkg_name(pkg)
        tmp_dir = Path(tempfile.mkdtemp(prefix="pachuli-pkgbuild-"))
        try:
            pkg_dir = tmp_dir / pkg
            if shutil.which("git"):
                msg(f"Fetching PKGBUILD for {pkg}...", Colors.BLUE, self.opts.quiet)
                result = subprocess.run(
                    ["git", "clone", "--depth", "1", f"{AUR_ADDR}/{pkg}.git", str(pkg_dir)],
                    capture_output=True, text=True,
                )
                if result.returncode != 0:
                    die(f"failed to clone package repo: {AUR_ADDR}/{pkg}.git")
            else:
                msg(f"Retrieving package archive: {pkg}", Colors.BLUE, self.opts.quiet)
                tarball_url = f"{AUR_ADDR}/cgit/aur.git/snapshot/{pkg}.tar.gz"
                tarball_path = tmp_dir / f"{pkg}.tar.gz"
                try:
                    urllib.request.urlretrieve(tarball_url, tarball_path)
                except urllib.error.URLError:
                    die(f"failed to download package: {pkg}")
                result = subprocess.run(["tar", "-xf", str(tarball_path)], cwd=tmp_dir,
                                         capture_output=True)
                if result.returncode != 0:
                    die(f"failed to extract package or not a tar.gz archive: {pkg}")
            pkgbuild = pkg_dir / "PKGBUILD"
            if not pkgbuild.is_file():
                die(f"'{pkg}' does not contain a PKGBUILD or was not found in the AUR")
            return pkgbuild.read_text(errors="replace")
        finally:
            shutil.rmtree(tmp_dir, ignore_errors=True)

    def get(self, pkg: str) -> bool:
        pkg = validate_pkg_name(pkg)
        if pkg in self._build_stack:
            die(
                f"Abhängigkeitszyklus erkannt: '{pkg}' wird bereits weiter "
                f"oben in der Abhängigkeitskette gebaut "
                f"({' -> '.join(self._build_stack)} -> {pkg})."
            )
        self._build_stack.append(pkg)
        try:
            pkg_dir = self.opts.builddir / pkg
            self._fetch_or_clone(pkg, pkg_dir)

            if not (pkg_dir / "PKGBUILD").is_file():
                die(f"{pkg_dir} does not contain a PKGBUILD or it is not accessible")

            self._verify_pkgbuild_identity(pkg, pkg_dir)

            if self.view_pkgbuild(pkg):
                pass
            else:
                if not yesno(f"Continue building {pkg}", self.opts.noconfirm):
                    shutil.rmtree(pkg_dir, ignore_errors=True)
                    return False

            return self.build(pkg)
        finally:
            self._build_stack.remove(pkg)

    def _verify_pkgbuild_identity(self, pkg: str, pkg_dir: Path) -> None:
        """Stellt sicher, dass das geklonte/entpackte PKGBUILD tatsächlich
        das angeforderte Paket baut (pkgname bzw. pkgbase == pkg), damit
        z.B. bei "pikaur" nicht versehentlich "pikaur-git" o.ä. gebaut wird."""
        pkgbuild = pkg_dir / "PKGBUILD"
        content = pkgbuild.read_text(errors="replace")

        pkgbase_match = re.search(r"^pkgbase\s*=\s*(\S+)", content, re.MULTILINE)
        pkgname_matches = re.findall(r"^pkgname\s*=\s*\(?['\"]?([\w.+-]+)", content, re.MULTILINE)
        # pkgname kann auch als Array über mehrere Zeilen stehen; einfacher,
        # robuster Fallback: alle Wort-Tokens in einem etwaigen pkgname=(...)-Block
        array_match = re.search(r"pkgname\s*=\s*\(([^)]*)\)", content)
        if array_match:
            pkgname_matches += re.findall(r"['\"]?([\w.+-]+)['\"]?", array_match.group(1))

        valid_names = set(pkgname_matches)
        if pkgbase_match:
            valid_names.add(pkgbase_match.group(1))

        if valid_names and pkg not in valid_names:
            shutil.rmtree(pkg_dir, ignore_errors=True)
            die(
                f"Sicherheitsabbruch: angefordertes Paket '{pkg}' stimmt nicht mit "
                f"pkgname/pkgbase im PKGBUILD überein ({', '.join(sorted(valid_names))}). "
                f"Abgebrochen, um nicht versehentlich ein anderes Paket zu bauen."
            )

    # -- Suche -----------------------------------------------------------

    def search(self, queries: list[str], interactive: bool = False) -> list[str]:
        """Sucht nach `queries`. Im interaktiven Modus (bare `pachuli <begriff>`,
        analog zu `yay <begriff>`) wird nach jeder Trefferliste zur Auswahl
        der zu installierenden Pakete per Nummer gefragt; die gewählten
        Paketnamen werden zurückgegeben (die eigentliche Installation macht
        der Aufrufer über self.install(), nach Klassifizierung Repo/AUR)."""
        selected: list[str] = []
        installed = installed_versions_all()
        for query in queries:
            msg(f"Searching repos and AUR for '{query}'...\n", Colors.BLUE, self.opts.quiet)
            # Repo-Suche (lokaler pacman-Aufruf) und AUR-Suche (HTTP-Request)
            # sind unabhängig voneinander - parallel statt sequentiell starten.
            with ThreadPoolExecutor(max_workers=2) as pool:
                repo_future = pool.submit(
                    (lambda: []) if self.opts.auronly else (lambda: search_sync_repos(query))
                )
                aur_future = pool.submit(self.aur.search, query)
                results = repo_future.result()
                aur_results = aur_future.result()
            for entry in results:
                entry.setdefault("Repository", "repo")
            for entry in aur_results:
                entry["Repository"] = "aur"
            results = results + aur_results
            if not results:
                print(f"{Colors.RED}:: {Colors.RESET}no results found for '{query}'")
                continue
            results = rank_results(results, query)
            # Nummerierung folgt der Relevanz (1 = bester Treffer), die
            # Ausgabe selbst wird aber umgedreht, damit der beste Treffer
            # ganz unten steht (nah an der Eingabeaufforderung).
            numbered = list(enumerate(results, start=1))
            for i, entry in reversed(numbered):
                name = entry.get("Name", "")
                version = entry.get("Version", "")
                desc = entry.get("Description", "") or ""
                outdated = entry.get("OutOfDate") is not None
                repo = entry.get("Repository", "?")
                repo_color = Colors.for_repo(repo)
                line = (
                    f"{Colors.YELLOW}{i} "
                    f"{repo_color}{repo}/{Colors.RESET}"
                    f"{Colors.BRIGHT_BLUE}{name} {Colors.GREEN}{version} "
                )
                if outdated:
                    line += f"{Colors.RED}(Out of Date!) "
                installed_version = installed.get(name)
                if installed_version is not None:
                    if installed_version == version:
                        line += f"{Colors.WHITE}(Installed) "
                    else:
                        line += f"{Colors.WHITE}(Installed: {installed_version}) "
                print(line + Colors.RESET)
                if desc:
                    print(f"    {desc}")

            if interactive and not self.opts.quiet:
                try:
                    answer = input(
                        f"\n{Colors.BLUE}==>{Colors.RESET} {Colors.BOLD}Packages to install "
                        f"(eg: 1 2 3, 1-3 oder ^4, leer = keine){Colors.RESET} "
                    )
                except EOFError:
                    answer = ""
                chosen = parse_selection(answer, len(numbered))
                for i, entry in numbered:
                    if i in chosen:
                        selected.append(entry.get("Name", ""))
        return selected

    # -- Update -----------------------------------------------------------

    def update(self, packages: list[str], count_only: bool = False) -> None:
        """Bei count_only=True (-Qu) entspricht die Standardausgabe dem
        echten `pacman`/`yay -Qu`: eine Zeile pro aktualisierbarem Paket
        im Format 'name alte_version -> neue_version'. Mit zusätzlichem
        -q/--quiet wird stattdessen (wie bisher) nur eine nackte Zahl
        ausgegeben - praktisch für Statusleisten/Skripte."""
        noview_prev = self.opts.noview
        self.opts.noview = True  # keine PKGBUILD-Ansicht bei bereits installierten Paketen

        aur_pkgs = packages or installed_foreign_packages()

        if not aur_pkgs:
            if self.opts.auronly:
                if count_only:
                    if self.opts.quiet:
                        print(0)
                    # nicht-quiet: nichts zu listen, keine Ausgabe (wie 'pacman -Qu'
                    # bei nichts zu tun)
                else:
                    msg("No AUR packages installed..", Colors.BLUE, self.opts.quiet)
            else:
                if not count_only:
                    sync_flags = self.opts.sync_flags(upgrade=True)
                    if sync_flags:
                        escalate(["pacman", sync_flags] + (["--noconfirm"] if self.opts.noconfirm else []), self.opts)
                if count_only:
                    if self.opts.quiet:
                        print(f"0 {self._checkupdates_count()}")
                    else:
                        for line in self._checkupdates_lines():
                            print(line)
            self.opts.noview = noview_prev
            return

        repo_count_holder: dict[str, int] = {}
        repo_lines: list[str] = []
        if count_only and not self.opts.auronly:
            if self.opts.quiet:
                repo_count_holder["n"] = self._checkupdates_count()
            else:
                repo_lines = self._checkupdates_lines()
        elif not count_only and not self.opts.auronly:
            # Repo-Sync/-Upgrade vor der AUR-Prüfung, Flags richten sich
            # pacman-treu nach dem angegebenen y-Level (siehe Options.sync_flags):
            # -Su (ohne y) synct NICHT automatisch, nur -Sy/-Syy synchronisieren.
            # escalate() wählt bei --gui automatisch pkexec statt sudo/doas -
            # dieser Schritt darf also NICHT übersprungen werden, sonst gibt
            # es (wie berichtet) gar keine pkexec-Abfrage.
            sync_flags = self.opts.sync_flags(upgrade=True)
            if sync_flags:
                escalate(["pacman", sync_flags] + (["--noconfirm"] if self.opts.noconfirm else []), self.opts)

        msg("Synchronizing AUR package versions...", Colors.BLUE, self.opts.quiet or count_only)

        old_versions = self._installed_versions(aur_pkgs)
        new_versions = {entry["Name"]: entry.get("Version", "") for entry in self.aur.info(aur_pkgs)}

        upgradable = []
        for pkg in aur_pkgs:
            old_v = old_versions.get(pkg)
            new_v = new_versions.get(pkg)
            if old_v and new_v and old_v != new_v and vercmp(new_v, old_v) > 0:
                upgradable.append((pkg, new_v))

        devel_pkgs = []
        if self.opts.devel:
            already = {p for p, _ in upgradable}
            devel_pkgs = [p for p in aur_pkgs if is_devel_package(p) and p not in already]
            if devel_pkgs and not count_only:
                msg(
                    f"{len(devel_pkgs)} Devel-Paket(e) erkannt (--devel aktiv), "
                    f"werden zum Prüfen auf neue Commits neu gebaut: "
                    f"{', '.join(devel_pkgs)}",
                    Colors.YELLOW, self.opts.quiet,
                )

        if count_only:
            if self.opts.quiet:
                # Statusleisten-/Skript-Modus: nur nackte Zahlen
                if self.opts.auronly:
                    print(len(upgradable) + len(devel_pkgs))
                else:
                    print(f"{len(upgradable) + len(devel_pkgs)} {repo_count_holder.get('n', 0)}")
            else:
                # Standard (yay-/pacman-artig): eine Zeile pro Paket
                for pkg, new_v in upgradable:
                    old_v = old_versions.get(pkg, "?")
                    print(f"{pkg} {old_v} -> {new_v}")
                for pkg in devel_pkgs:
                    print(f"{pkg} (devel, neue Commits erkannt)")
                if not self.opts.auronly:
                    for line in repo_lines:
                        print(line)
            self.opts.noview = noview_prev
            return

        if not upgradable and not devel_pkgs:
            msg("there is nothing to do", quiet=self.opts.quiet)
        else:
            msg("Starting AUR package upgrade...", Colors.BLUE, self.opts.quiet)
            names = " ".join(f"{p}{Colors.DIM}-{v}{Colors.RESET}" for p, v in upgradable)
            if devel_pkgs:
                names += (" " if names else "") + " ".join(
                    f"{p}{Colors.DIM}-devel-check{Colors.RESET}" for p in devel_pkgs
                )
            print(f"\n{Colors.BOLD}Packages ({len(upgradable) + len(devel_pkgs)}){Colors.RESET} {names}\n")
            if yesno("Proceed with package upgrade", self.opts.noconfirm):
                for pkg, _ in upgradable:
                    self.get(pkg)
                for pkg in devel_pkgs:
                    self.get(pkg)

        self.opts.noview = noview_prev

    def _installed_versions(self, pkgs: list[str]) -> dict[str, str]:
        result = subprocess.run(["pacman", "-Q", *pkgs], capture_output=True, text=True)
        versions = {}
        for line in result.stdout.splitlines():
            parts = line.split()
            if len(parts) == 2:
                versions[parts[0]] = parts[1]
        return versions

    def _checkupdates_count(self) -> int:
        if not shutil.which("checkupdates"):
            return 0
        result = subprocess.run(["checkupdates"], capture_output=True, text=True)
        return len([l for l in result.stdout.splitlines() if l.strip()])

    def _checkupdates_lines(self) -> list[str]:
        """Rohe `checkupdates`-Ausgabe (bereits im Format
        'paket alte_version -> neue_version' pro Zeile, wie bei
        `pacman -Qu`), für die yay-artige Listenausgabe von -Qu."""
        if not shutil.which("checkupdates"):
            return []
        result = subprocess.run(["checkupdates"], capture_output=True, text=True)
        return [l for l in result.stdout.splitlines() if l.strip()]

    # -- Installation --------------------------------------------------

    def _find_provider(self, pkg: str) -> str | None:
        """Findet ein installiertes Paket, das `pkg` über 'Provides' bereitstellt,
        aber ANDERS heißt (z.B. 'pikaur-git' stellt 'pikaur' bereit). Ohne diese
        Prüfung würde `pacman -S pikaur --needed` fälschlich als "bereits erfüllt"
        übersprungen und weiterhin 'pikaur-git' behalten."""
        result = subprocess.run(["pacman", "-Qi"], capture_output=True, text=True)
        for block in result.stdout.split("\n\n"):
            name_match = re.search(r"^Name\s*:\s*(\S+)", block, re.MULTILINE)
            provides_match = re.search(r"^Provides\s*:\s*(.+)$", block, re.MULTILINE)
            if not (name_match and provides_match):
                continue
            provides_str = provides_match.group(1).strip()
            if provides_str == "None":
                continue
            provided_names = [re.split(r"[=<>]", p.strip())[0] for p in provides_str.split()]
            if pkg in provided_names and name_match.group(1) != pkg:
                return name_match.group(1)
        return None

    def _split_by_provides_conflict(self, pkgs: list[str]) -> tuple[list[str], dict[str, str]]:
        """Teilt Pakete in (normal installierbar mit --needed) und
        (nur über Provides eines anders benannten Pakets erfüllt) auf."""
        needed_ok, conflicts = [], {}
        for pkg in pkgs:
            exact_installed = subprocess.run(
                ["pacman", "-Qq", pkg], capture_output=True
            ).returncode == 0
            if exact_installed:
                needed_ok.append(pkg)
                continue
            provider = self._find_provider(pkg)
            if provider:
                conflicts[pkg] = provider
            else:
                needed_ok.append(pkg)
        return needed_ok, conflicts

    def install(self, repo_pkgs: list[str], aur_pkgs: list[str]) -> None:
        if self.opts.auronly and not aur_pkgs:
            if repo_pkgs:
                die("targets given are official packages (no --aur-only)")
            die("no targets specified for install")
        elif not self.opts.auronly and repo_pkgs:
            needed_ok, conflicts = self._split_by_provides_conflict(repo_pkgs)
            if self.opts.debug:
                print(f"# debug: needed_ok={needed_ok} conflicts={conflicts}", file=sys.stderr)

            # Flags richten sich pacman-treu nach dem angegebenen y-Level
            # (siehe Options.sync_flags): ohne -Sy/-Syy wird die Paket-
            # datenbank nicht zwangsweise neu geladen, es wird aber (wie
            # bisher) zusammen mit den Zielpaketen ein voller Upgrade
            # durchgeführt (`u`-Teil bleibt immer aktiv bei --install).
            cmd = ["pacman", self.opts.sync_flags(upgrade=True), *needed_ok, "--needed"]
            if self.opts.debug:
                print(f"# debug: cmd={cmd}", file=sys.stderr)
            if self.opts.noconfirm:
                cmd.append("--noconfirm")
            result = escalate(cmd, self.opts)
            if result.returncode != 0:
                raise PachuliError("pacman-Installation fehlgeschlagen", 1)

            for pkg, provider in conflicts.items():
                msg(
                    f"'{provider}' stellt aktuell '{pkg}' über Provides bereit "
                    f"und würde bei --needed übersprungen. Um wirklich '{pkg}' "
                    f"zu installieren, muss '{provider}' ersetzt werden.",
                    Colors.YELLOW, self.opts.quiet,
                )
                if yesno(f"'{pkg}' installieren und dabei '{provider}' ersetzen", self.opts.noconfirm):
                    replace_cmd = ["pacman", "-S", pkg]
                    if self.opts.noconfirm:
                        replace_cmd.append("--noconfirm")
                    result = escalate(replace_cmd, self.opts)
                    if result.returncode != 0:
                        raise PachuliError(f"Ersetzen von '{provider}' durch '{pkg}' fehlgeschlagen", 1)
                else:
                    msg(f"'{pkg}' übersprungen, '{provider}' bleibt installiert", quiet=self.opts.quiet)

        for pkg in aur_pkgs:
            if self.aur.exists(pkg):
                if not self.get(pkg):
                    msg(f"Exited {pkg} build early", Colors.YELLOW, self.opts.quiet)
            else:
                die(f"unable to find package '{pkg}', is the name spelled correctly?")

    # -- Entfernen --------------------------------------------------

    def remove(self, packages: list[str], purge: bool = False) -> None:
        """Entfernt Pakete via pacman -R (bzw. -Rns bei purge=True).

        -Rs entfernt zusätzlich verwaiste Abhängigkeiten, -Rns zusätzlich
        auch die zugehörigen Konfigurationsdateien.
        """
        not_installed = [
            pkg for pkg in packages
            if subprocess.run(
                ["pacman", "-Qq", pkg], capture_output=True
            ).returncode != 0
        ]
        if not_installed:
            die(f"target(s) not installed: {', '.join(not_installed)}")

        flags = "-Rns" if purge else "-Rs"
        msg(f"Removing package(s): {', '.join(packages)}", Colors.BLUE, self.opts.quiet)
        if not yesno(f"Proceed with removing {', '.join(packages)}", self.opts.noconfirm):
            msg("Abgebrochen", quiet=self.opts.quiet)
            return

        cmd = ["pacman", flags, *packages]
        if self.opts.noconfirm:
            cmd.append("--noconfirm")
        result = escalate(cmd, self.opts)
        if result.returncode != 0:
            raise PachuliError("pacman-Deinstallation fehlgeschlagen", 1)

    # -- Query-Info (-Qi / -Qii) -----------------------------------------

    def query_info(self, packages: list[str], extended: bool = False) -> None:
        """Entspricht `pacman -Qi` (bzw. `-Qii` für zusätzlich die Liste
        der Backup-Dateien samt Änderungsstatus): Detailinfos zu bereits
        installierten Paketen. Ohne Angabe von Paketen werden alle
        installierten Pakete aufgelistet - bei aktivem -a/--aur-only in
        dem Fall nur die Fremd-/AUR-Pakete (wie bei `pacman -Qim`)."""
        targets = packages or (installed_foreign_packages() if self.opts.auronly else [])
        flag = "-Qii" if extended else "-Qi"
        result = subprocess.run(["pacman", flag, *targets])
        if result.returncode != 0:
            raise PachuliError("pacman -Qi meldete einen Fehler (siehe Ausgabe oben)", 1)

    # -- Sync-Info (-Si) ---------------------------------------------------

    def sync_info(self, packages: list[str]) -> None:
        """Entspricht `pacman -Si` für Pakete aus den Sync-Repos; für alles,
        was pacman dort nicht kennt (oder generell bei -a/--aur-only),
        wird stattdessen automatisch ein Info-Block aus dem AUR (RPC v5)
        angezeigt. Wie bei der Suche deckt pachuli hier beide Quellen ab,
        nicht nur pacmans eigene Sync-Datenbanken."""
        if self.opts.auronly:
            repo_pkgs, aur_pkgs = [], list(packages)
        else:
            repo_pkgs, aur_pkgs = classify_packages(packages)

        ok = True
        if repo_pkgs:
            result = subprocess.run(["pacman", "-Si", *repo_pkgs])
            ok = ok and result.returncode == 0

        if aur_pkgs:
            entries = self.aur.info(aur_pkgs)
            found = {e.get("Name") for e in entries}
            for entry in entries:
                self._print_aur_info(entry)
            missing = [p for p in aur_pkgs if p not in found]
            for name in missing:
                print(f"{Colors.RED}error:{Colors.RESET} package '{name}' was not found", file=sys.stderr)
                ok = False

        if not ok:
            raise PachuliError("ein oder mehrere Pakete wurden nicht gefunden", 1)

    def _print_aur_info(self, entry: dict) -> None:
        """Formatiert einen AUR-RPC-Eintrag im Stil von `pacman -Si`."""

        def line(label: str, value) -> None:
            print(f"{Colors.BOLD}{label:<15}: {Colors.RESET}{value}")

        print(f"{Colors.BOLD}Repository      : {Colors.RESET}{Colors.for_repo('aur')}aur{Colors.RESET}")
        line("Name", entry.get("Name", ""))
        line("Version", entry.get("Version", ""))
        line("Description", entry.get("Description") or "None")
        line("URL", entry.get("URL") or "None")
        depends = entry.get("Depends") or []
        line("Depends On", " ".join(depends) if depends else "None")
        makedepends = entry.get("MakeDepends") or []
        line("Make Depends", " ".join(makedepends) if makedepends else "None")
        line("Maintainer", entry.get("Maintainer") or "None")
        line("Votes", entry.get("NumVotes", 0))
        line("Popularity", round(float(entry.get("Popularity") or 0.0), 2))
        line("Out Of Date", "Yes" if entry.get("OutOfDate") else "No")
        licenses = entry.get("License") or []
        line("Licenses", " ".join(licenses) if licenses else "None")
        for key, label in (("FirstSubmitted", "First Submitted"), ("LastModified", "Last Modified")):
            ts = entry.get(key)
            if ts:
                line(label, datetime.fromtimestamp(ts).strftime("%a %d %b %Y %H:%M:%S"))
        print()

    # -- Cache leeren (-Sc / -Scc) -----------------------------------------

    def clean_cache(self, force: bool = False) -> None:
        """Entspricht `pacman -Sc`/`-Scc` (Paket-Cache bereinigen: einmal
        'c' entfernt nicht mehr installierte Paketversionen, zweimal 'c'
        räumt den kompletten Cache leer). Zusätzlich wird - wie bei yay -
        angeboten, auch pachulis eigenes Build-Verzeichnis zu bereinigen:
        bei -Sc nur die Build-Ordner nicht (mehr) installierter AUR-Pakete,
        bei -Scc ausnahmslos alle. Mit -a/--aur-only wird der pacman-eigene
        Paket-Cache nicht angefasst, nur der pachuli-Build-Cache."""
        if not self.opts.auronly:
            flags = "-Scc" if force else "-Sc"
            cmd = ["pacman", flags]
            if self.opts.noconfirm:
                cmd.append("--noconfirm")
            result = escalate(cmd, self.opts)
            if result.returncode != 0:
                msg("pacman-Cache-Bereinigung übersprungen oder abgebrochen", Colors.YELLOW, self.opts.quiet)

        if not self.opts.builddir.is_dir():
            return
        installed = installed_versions_all()
        stale_dirs = sorted(
            d for d in self.opts.builddir.iterdir()
            if d.is_dir() and (force or d.name not in installed)
        )
        if not stale_dirs:
            msg("Kein pachuli-Build-Cache zu bereinigen", quiet=self.opts.quiet)
            return
        label = "alle" if force else "nicht mehr installierte"
        msg(
            f"{label} Build-Ordner in {self.opts.builddir} gefunden ({len(stale_dirs)}): "
            f"{', '.join(d.name for d in stale_dirs)}",
            Colors.BLUE, self.opts.quiet,
        )
        if yesno("pachuli-Build-Cache jetzt bereinigen", self.opts.noconfirm):
            for d in stale_dirs:
                shutil.rmtree(d, ignore_errors=True)
            msg("pachuli-Build-Cache bereinigt", Colors.GREEN, self.opts.quiet)
        else:
            msg("Build-Cache-Bereinigung übersprungen", quiet=self.opts.quiet)

    # -- Verwaiste Abhängigkeiten entfernen (-Yc) --------------------------

    def clean_orphans(self) -> None:
        """Entspricht `yay -Yc` bzw. dem klassischen
        `pacman -Rns $(pacman -Qtdq)`: findet und entfernt verwaiste
        Abhängigkeiten - als Fremdabhängigkeit installierte Pakete, die
        von keinem anderen installierten Paket mehr benötigt werden."""
        result = subprocess.run(["pacman", "-Qtdq"], capture_output=True, text=True)
        orphans = [line for line in result.stdout.splitlines() if line.strip()]
        if not orphans:
            msg("no unneeded packages found", quiet=self.opts.quiet)
            return
        msg(
            f"{len(orphans)} verwaiste Abhängigkeit(en) gefunden: {', '.join(orphans)}",
            Colors.BLUE, self.opts.quiet,
        )
        if not yesno(f"Verwaiste Abhängigkeiten entfernen ({', '.join(orphans)})", self.opts.noconfirm):
            msg("Abgebrochen", quiet=self.opts.quiet)
            return
        cmd = ["pacman", "-Rns", *orphans]
        if self.opts.noconfirm:
            cmd.append("--noconfirm")
        result = escalate(cmd, self.opts)
        if result.returncode != 0:
            raise PachuliError("Entfernen der verwaisten Abhängigkeiten fehlgeschlagen", 1)


# --------------------------------------------------------------------------
# Systemvoraussetzungen prüfen
# --------------------------------------------------------------------------

def check_requirements() -> None:
    if os.geteuid() == 0:
        die("do not run pachuli as root")
    if not (shutil.which("makepkg") and shutil.which("pacman")):
        die("pachuli only supports systems that use pacman as their package manager")
    if not (shutil.which("su")):
        die("pachuli requires the following packages: su\n\n\toptional packages: git sudo doas pacman-contrib")


# --------------------------------------------------------------------------
# CLI (pacman/yay-artige Syntax: eine Operation + stapelbare Modifikatoren)
# --------------------------------------------------------------------------
#
# Statt einzelner argparse-Flags wie -s/-u/-i/-c/-r übernimmt pachuli hier
# das Parsing-Modell von pacman/yay: genau EINE Großbuchstaben-Operation
# (-S = Sync/Install, -R = Remove, -Q = Query) plus optionale, stapelbare
# Kleinbuchstaben-Modifikatoren, z.B.:
#
#   pachuli -Ss firefox     Suche (S + Modifikator s)
#   pachuli -S paket        Installation (S ohne Modifikator)
#   pachuli -Su             Update aller AUR-Pakete, Repos ohne DB-Refresh (S + u)
#   pachuli -Syu            wie -Su, zusätzlich normaler Repo-DB-Refresh
#   pachuli -Syyu           wie -Syu, Repo-DB-Refresh erzwungen
#   pachuli -R paket        Entfernen
#   pachuli -Rns paket      Entfernen inkl. Konfigurationsdateien
#   pachuli -Qu             Liste verfügbarer Updates (name alt -> neu, wie yay -Qu)
#   pachuli -Qu -q          wie -Qu, aber nur nackte Zahlen (für Statuszeilen)
#   pachuli -Qi [paket ...] Detailinfos zu installierten Paketen (pacman -Qi)
#   pachuli -Qii            wie -Qi, zusätzlich Backup-Dateien/Änderungsstatus
#   pachuli -Si paket       Sync-/AUR-Paketinfo (pacman -Si, plus AUR-Fallback)
#   pachuli -Sc / -Scc      Paket-Cache leeren (einfach/komplett), inkl.
#                           pachulis eigenem AUR-Build-Cache
#   pachuli -Yc             verwaiste Abhängigkeiten suchen und entfernen
#                           (wie yay -Yc, entspricht pacman -Rns $(pacman -Qtdq))
#
# -Q unterstützt neben 'u' (Updates) bewusst nur noch 'i'/'ii' (Info) als
# weiteren Modifikator, jeweils mit echtem pacman/yay-Ausgabeformat als
# Standard - für alles darüber hinaus (z.B. das Auflisten ALLER installierten
# Pakete ohne Filterung) bitte weiterhin `pacman -Q` direkt nutzen.

LONG_TO_SHORT = {
    "sync": "S", "remove": "R", "query": "Q", "yay": "Y",
    "search": "s", "update": "u", "refresh": "y",
    "aur-only": "a", "gui": "g", "view": "v", "debug": "d",
    "quiet": "q", "noconfirm": "N",
    "purge": "n", "nosave": "n", "pkgbuild": "p",
}
WORD_FLAGS = {"devel", "cleanbuild"}  # nur als --lang-flags verfügbar, kein Kurzbuchstabe
# 'i' (Info: -Qi/-Qii, -Si) und 'c' (Clean: -Sc/-Scc, -Yc) werden wie 'y'
# separat gezählt (i_count/c_count), um zwischen einfacher und doppelter
# Angabe zu unterscheiden (-Qi vs. -Qii, -Sc vs. -Scc) - siehe parse_pachuli_args.
SHORT_CHARS = set("SRQYsuynagvdqNicp")

USAGE = """usage: pachuli {-S | -R | -Q | -Y} [optionen] [ziel ...]
       pachuli <begriff ...>   (bare-modus, siehe unten)

operationen (genau eine erforderlich, außer im bare-modus):
  -S            Sync: Pakete suchen/installieren/aktualisieren/Info/Cache leeren
  -R            Remove: Pakete entfernen
  -Q            Query: Modifikatoren 'u' (Updates) oder 'i'/'ii' (Info)
  -Y            Yay-artige Zusatzfunktionen: nur mit Modifikator 'c' unterstützt

bare-modus (wie 'yay <begriff>'):
  pachuli <begriff ...>   Suche wie -Ss, fragt danach per Nummer(n) ab,
                          welche Treffer direkt installiert werden sollen
                          (z.B. "1 3", "1-3", "^4", "all", leer = keine)

häufige kombinationen:
  -Ss <begriff>     im AUR und den Repos suchen
  -S <paket ...>    Paket(e) installieren
  -Su [paket ...]   Updates prüfen, Repos OHNE Datenbank-Refresh
  -Syu              wie -Su, zusätzlich normaler Repo-DB-Refresh
  -Syyu             wie -Syu, Repo-DB-Refresh erzwungen
  -Si <paket ...>   Sync-/AUR-Info zu (noch) nicht installierten Paketen
  -Sp <paket ...>   PKGBUILD anzeigen, ohne zu bauen/installieren
  -Sc               Paket-Cache leeren (nicht mehr installierte Versionen)
  -Scc              Paket-Cache komplett leeren (auch installierte Pakete)
  -R <paket ...>    Paket(e) entfernen
  -Rns <paket ...>  Paket(e) inkl. Konfigurationsdateien entfernen
  -Qu               verfügbare Updates auflisten (name alt -> neu, wie yay -Qu)
  -Qu -q            wie -Qu, aber nur nackte Zahlen (für Statuszeilen)
  -Qi [paket ...]   Detailinfos zu installierten Paketen (leer = alle)
  -Qii [paket ...]  wie -Qi, zusätzlich Backup-Dateien und deren Status
  -Yc               verwaiste Abhängigkeiten suchen und entfernen (wie yay -Yc)

modifikatoren:
  a   --aur-only         nur AUR berücksichtigen (mit -S/-Q)
  i   --info             Info anzeigen (-Qi/-Qii installiert, -Si Sync/AUR)
  c   --clean            Cache leeren (-Sc/-Scc) bzw. verwaiste Abh. (-Yc)
  p   --pkgbuild         PKGBUILD abrufen und ausgeben, ohne zu bauen (mit -S)
  n   --nosave, --purge  bei -R: Konfigurationsdateien mitentfernen

weitere optionen:
  -v, --view        PKGBUILD vor dem Bauen ansehen/bearbeiten
  -N, --noconfirm   keine Rückfragen stellen
  -g, --gui         pkexec statt sudo/doas verwenden
  -d, --debug       Debug-Ausgabe aktivieren
  -q, --quiet       Statusmeldungen unterdrücken
  --devel           VCS-/Devel-Pakete auf neue Commits prüfen (mit -Su)
  --cleanbuild      makepkg mit -C bauen (frischer Build)
  --builddir PATH   Build-Verzeichnis festlegen
  --version         Version anzeigen
  -h, --help        diese Hilfe anzeigen

datenbank-refresh (pacman-treu):
  -Su    kein automatischer Sync, nur Upgrade aus lokalem Cache
  -Syu   normaler Sync (nur falls Datenbank veraltet ist) + Upgrade
  -Syyu  erzwungener Sync (auch wenn Datenbank aktuell aussieht) + Upgrade
"""


@dataclass
class ParsedArgs:
    action: str  # "search"|"install"|"update"|"count"|"remove"|"combined"|
                 # "sync_info"|"query_info"|"clean_cache"|"clean_orphans"
    packages: list[str]
    cli_flags: set  # enthält Kurzbuchstaben (z.B. "a","N",...) und Worte ("devel","cleanbuild")
    builddir: Path | None
    purge: bool
    refresh_level: int = 0  # Anzahl 'y' (0 = kein Sync, 1 = -Sy, 2+ = -Syy erzwungen)
    info_level: int = 0  # Anzahl 'i' (1 = -Qi/-Si, 2+ = -Qii)
    clean_level: int = 0  # Anzahl 'c' (1 = -Sc, 2+ = -Scc)


def parse_pachuli_args(argv: list[str]) -> ParsedArgs:
    """Pacman/yay-artiges Getopt-Parsing: Operation (S/R/Q) + Modifikatoren,
    beliebig stapel- oder trennbar (-Rns == -R -n -s), plus --lang-optionen."""
    cli_flags: set = set()
    packages: list[str] = []
    builddir: Path | None = None
    stop_parsing = False
    y_count = 0  # separat gezählt, da -Syy (zweifaches y) sich von -Sy unterscheidet
    i_count = 0  # separat gezählt, da -Qii (zweifaches i) sich von -Qi unterscheidet
    c_count = 0  # separat gezählt, da -Scc (zweifaches c) sich von -Sc unterscheidet

    i = 0
    n = len(argv)
    while i < n:
        tok = argv[i]

        if stop_parsing:
            packages.append(tok)
            i += 1
            continue

        if tok == "--":
            stop_parsing = True
            i += 1
            continue

        if tok in ("-h", "--help"):
            print(USAGE)
            raise SystemExit(0)
        if tok == "--version":
            print(f"pachuli {VERSION}")
            raise SystemExit(0)

        if tok.startswith("--") and len(tok) > 2:
            name = tok[2:]
            value = None
            if "=" in name:
                name, _, value = name.partition("=")
            if name == "builddir":
                if value is None:
                    i += 1
                    if i >= n:
                        die("--builddir erwartet einen Pfad")
                    value = argv[i]
                builddir = Path(value).expanduser()
            elif name == "refresh":
                cli_flags.add("y")
                y_count += 1
            elif name == "info":
                cli_flags.add("i")
                i_count += 1
            elif name == "clean":
                cli_flags.add("c")
                c_count += 1
            elif name in WORD_FLAGS:
                cli_flags.add(name)
            elif name in LONG_TO_SHORT:
                cli_flags.add(LONG_TO_SHORT[name])
            else:
                die(f"unbekannte Option '--{name}' (siehe pachuli --help)")
            i += 1
            continue

        if tok.startswith("-") and len(tok) > 1:
            for ch in tok[1:]:
                if ch not in SHORT_CHARS:
                    die(f"unbekannte Option '-{ch}' (siehe pachuli --help)")
                cli_flags.add(ch)
                if ch == "y":
                    y_count += 1
                elif ch == "i":
                    i_count += 1
                elif ch == "c":
                    c_count += 1
            i += 1
            continue

        packages.append(tok)
        i += 1

    operations = cli_flags & {"S", "R", "Q", "Y"}
    if len(operations) == 0:
        if packages:
            # Bare-Modus, analog zu `yay <begriff>`: Suche + anschließende
            # interaktive Auswahl der zu installierenden Pakete per Nummer.
            return ParsedArgs(
                action="combined",
                packages=packages,
                cli_flags=cli_flags,
                builddir=builddir,
                purge="n" in cli_flags,
                refresh_level=y_count,
                info_level=i_count,
                clean_level=c_count,
            )
        die("keine Operation angegeben (-S, -R, -Q oder -Y erforderlich, siehe pachuli --help)")
    if len(operations) > 1:
        die("nur eine Operation (-S, -R, -Q oder -Y) darf angegeben werden")
    operation = operations.pop()

    if operation == "S":
        modes = []
        if "s" in cli_flags:
            modes.append("s")
        if "i" in cli_flags:
            modes.append("i")
        if "c" in cli_flags:
            modes.append("c")
        if "p" in cli_flags:
            modes.append("p")
        if "u" in cli_flags or "y" in cli_flags:
            modes.append("u")
        if len(modes) > 1:
            die("die Modifikatoren s/u/i/c/p (Suche/Update/Info/Cache-Clean/PKGBUILD) schließen sich bei -S gegenseitig aus")
        if "s" in cli_flags:
            action = "search"
        elif "i" in cli_flags:
            action = "sync_info"
        elif "c" in cli_flags:
            action = "clean_cache"
        elif "p" in cli_flags:
            action = "get_pkgbuild"
        elif "u" in cli_flags or "y" in cli_flags:
            action = "update"
        else:
            action = "install"
    elif operation == "R":
        action = "remove"
    elif operation == "Q":
        if "u" in cli_flags and "i" in cli_flags:
            die("-Qu und -Qi/-Qii schließen sich gegenseitig aus")
        if "i" in cli_flags:
            action = "query_info"
        elif "u" in cli_flags:
            action = "count"
        else:
            die("von -Q wird nur 'pachuli -Qu', '-Qi' oder '-Qii' unterstützt (siehe pachuli --help)")
    else:  # Y
        if "c" not in cli_flags:
            die("von -Y wird nur 'pachuli -Yc' unterstützt (verwaiste Abhängigkeiten entfernen, siehe pachuli --help)")
        action = "clean_orphans"

    return ParsedArgs(
        action=action,
        packages=packages,
        cli_flags=cli_flags,
        builddir=builddir,
        purge="n" in cli_flags,
        refresh_level=y_count,
        info_level=i_count,
        clean_level=c_count,
    )


def main(argv: list[str] | None = None) -> int:
    argv = sys.argv[1:] if argv is None else argv
    try:
        parsed = parse_pachuli_args(argv)
    except PachuliError as exc:
        return exc.code

    config = load_config()

    def resolve(flag, config_key: str, builtin_default: bool) -> bool:
        """CLI-Flag (falls gesetzt) > Konfigdatei-Wert > eingebauter Standard."""
        if flag in parsed.cli_flags:
            return True
        if config_key in config:
            return config[config_key]
        return builtin_default

    builddir = parsed.builddir if parsed.builddir is not None else config.get("builddir", DEFAULT_BUILD_DIR)

    # noview ist das Gegenteil von -v/--view: Standard ist "an" (kein
    # Ansehen des PKGBUILD), -v schaltet es aus. CLI hat Vorrang vor der
    # Konfigdatei, die wiederum vor dem eingebauten Standard (True).
    if "v" in parsed.cli_flags:
        noview = False
    elif "noview" in config:
        noview = config["noview"]
    else:
        noview = True

    opts = Options(
        auronly=resolve("a", "auronly", False),
        noconfirm=resolve("N", "noconfirm", False),
        noview=noview,
        gui=resolve("g", "gui", False),
        debug=resolve("d", "debug", False),
        quiet=resolve("q", "quiet", False),
        devel=resolve("devel", "devel", False),
        cleanbuild=resolve("cleanbuild", "cleanbuild", False),
        builddir=builddir,
        refresh=parsed.refresh_level,
    )

    if opts.debug:
        print(f"# debug: parsed={parsed}", file=sys.stderr)
        print(f"# debug: config={config}", file=sys.stderr)
        print(f"# debug: opts={opts}", file=sys.stderr)

    # -Qu liefert bewusst nur eine nackte Zahl (für Statusleisten, Skripte
    # etc.) - dort keine zusätzliche Meldung ausgeben, die Installation
    # der Completions läuft aber still im Hintergrund trotzdem mit.
    ensure_completions_installed(quiet=opts.quiet or parsed.action == "count")

    try:
        if not parsed.packages and parsed.action not in (
            "update", "count", "query_info", "clean_cache", "clean_orphans",
        ):
            die(f"no targets specified for {parsed.action}")

        check_requirements()
        pac = Pachuli(opts)

        if parsed.action == "search":
            pac.search(parsed.packages)
        elif parsed.action == "combined":
            selected = pac.search(parsed.packages, interactive=True)
            if not selected:
                msg("Keine Pakete zur Installation ausgewählt", quiet=opts.quiet)
            else:
                repo_pkgs, aur_pkgs = classify_packages(selected)
                if opts.debug:
                    print(f"# debug: repo_pkgs={repo_pkgs} aur_pkgs={aur_pkgs}", file=sys.stderr)
                pac.install(repo_pkgs, aur_pkgs)
        elif parsed.action == "update":
            pac.update(parsed.packages, count_only=False)
        elif parsed.action == "count":
            if not shutil.which("checkupdates") and not opts.auronly:
                die("-Qu ohne -a/--aur-only benötigt das Paket 'pacman-contrib'")
            pac.update(parsed.packages, count_only=True)
        elif parsed.action == "install":
            if opts.auronly:
                # -a/--aur-only: baue gezielt aus dem AUR, auch wenn ein
                # gleichnamiges Paket zusätzlich in einem Sync-Repo
                # existiert - klassifiziere hier bewusst NICHT über
                # classify_packages() (das würde wie ohne -a immer das
                # Repo bevorzugen). Ohne das hier würde pac.install()
                # unten schlicht mit "targets given are official
                # packages" abbrechen, sobald ein Ziel auch im Repo
                # bekannt ist - -a hätte also nie etwas bewirkt.
                repo_pkgs, aur_pkgs = [], list(parsed.packages)
            else:
                repo_pkgs, aur_pkgs = classify_packages(parsed.packages)
            if opts.debug:
                print(f"# debug: repo_pkgs={repo_pkgs} aur_pkgs={aur_pkgs}", file=sys.stderr)
            pac.install(repo_pkgs, aur_pkgs)
        elif parsed.action == "get_pkgbuild":
            for pkg in parsed.packages:
                print(pac.get_pkgbuild_text(pkg))
        elif parsed.action == "remove":
            pac.remove(parsed.packages, purge=parsed.purge)
        elif parsed.action == "sync_info":
            pac.sync_info(parsed.packages)
        elif parsed.action == "query_info":
            pac.query_info(parsed.packages, extended=parsed.info_level >= 2)
        elif parsed.action == "clean_cache":
            pac.clean_cache(force=parsed.clean_level >= 2)
        elif parsed.action == "clean_orphans":
            pac.clean_orphans()

    except PachuliError as exc:
        return exc.code
    except KeyboardInterrupt:
        print("^C")
        return 130

    return 0


if __name__ == "__main__":
    sys.exit(main())
