#!/usr/bin/env python3

import argparse
import json
import os
import sqlite3
import subprocess
import sys
from pathlib import Path

APP_NAME = "shamela"

PATH_ROOT_OPT_SHAMELA_DIR = Path("/opt/shamela")
PATH_ROOT_OPT_SHAMELA_TARBALL = PATH_ROOT_OPT_SHAMELA_DIR / "shamela.tar.xz"

ENV_XDG_DATA_HOME = os.environ.get("XDG_DATA_HOME")
PATH_HOME_SHARE_ROOT = (
    Path(ENV_XDG_DATA_HOME).expanduser()
    if ENV_XDG_DATA_HOME
    else Path.home() / ".local/share"
)

PATH_HOME_SHARE_SHAMELA_DIR = PATH_HOME_SHARE_ROOT / "shamela"
PATH_HOME_SHARE_SHAMELA_APP_DIR = PATH_HOME_SHARE_SHAMELA_DIR / "app"
PATH_HOME_SHARE_SHAMELA_DATABASE_DIR = PATH_HOME_SHARE_SHAMELA_DIR / "database"
PATH_HOME_SHARE_SHAMELA_DATABASE_USER_DIR = (
    PATH_HOME_SHARE_SHAMELA_DATABASE_DIR / "user"
)
PATH_HOME_SHARE_SHAMELA_DATABASE_USER_DATADB = (
    PATH_HOME_SHARE_SHAMELA_DATABASE_USER_DIR / "data.db"
)
PATH_HOME_SHARE_SHAMELA_APPIMAGE = PATH_HOME_SHARE_SHAMELA_DIR / "shamela.AppImage"


def _die(message: str) -> None:
    print(f"{APP_NAME}: error: {message}", file=sys.stderr)
    sys.exit(1)


def _info(message: str) -> None:
    print(f"{APP_NAME}: {message}", file=sys.stderr)


def _warn(message: str) -> None:
    _info(f"warning: {message}")


def _resolve_root_tarball() -> Path:
    if not PATH_ROOT_OPT_SHAMELA_TARBALL.is_file():
        _die(f"missing root tarball at {PATH_ROOT_OPT_SHAMELA_TARBALL}")
    return PATH_ROOT_OPT_SHAMELA_TARBALL


def _run_tar(args: list[str]) -> None:
    result = subprocess.run(["tar", *args])
    if result.returncode != 0:
        _die(f"tar failed with exit code {result.returncode}")


def _tar_extract(tarball: Path, dest_dir: Path, prefix: str) -> None:
    _run_tar(
        ["-xJf", str(tarball), "-C", str(dest_dir), "--strip-components=1", prefix]
    )


def _ensure_exec(path: Path) -> None:
    mode = path.stat().st_mode
    path.chmod(mode | 0o111)


def _seed_from_tarball(tarball: Path) -> None:
    need_app = not PATH_HOME_SHARE_SHAMELA_APP_DIR.exists()
    need_database = not PATH_HOME_SHARE_SHAMELA_DATABASE_DIR.exists()
    need_appimage = not PATH_HOME_SHARE_SHAMELA_APPIMAGE.exists()

    if not need_app:
        _warn(f"{PATH_HOME_SHARE_SHAMELA_APP_DIR} already exists")
    if not need_database:
        _warn(f"{PATH_HOME_SHARE_SHAMELA_DATABASE_DIR} already exists")
    if not need_appimage:
        _warn(f"{PATH_HOME_SHARE_SHAMELA_APPIMAGE} already exists")

    if not (need_app or need_database or need_appimage):
        _die("nothing copied: app/, database/, and AppImage already exist")

    PATH_HOME_SHARE_SHAMELA_DIR.mkdir(parents=True, exist_ok=True)

    if need_app:
        _tar_extract(tarball, PATH_HOME_SHARE_SHAMELA_DIR, "shamela/app")
    if need_database:
        _tar_extract(tarball, PATH_HOME_SHARE_SHAMELA_DIR, "shamela/database")
    if need_appimage:
        _tar_extract(tarball, PATH_HOME_SHARE_SHAMELA_DIR, "shamela/shamela.AppImage")
        _ensure_exec(PATH_HOME_SHARE_SHAMELA_APPIMAGE)


def _seed_missing_from_tarball(tarball: Path) -> None:
    need_app = not PATH_HOME_SHARE_SHAMELA_APP_DIR.exists()
    need_database = not PATH_HOME_SHARE_SHAMELA_DATABASE_DIR.exists()
    need_appimage = not PATH_HOME_SHARE_SHAMELA_APPIMAGE.exists()

    if not (need_app or need_database or need_appimage):
        return

    PATH_HOME_SHARE_SHAMELA_DIR.mkdir(parents=True, exist_ok=True)

    if need_app:
        _tar_extract(tarball, PATH_HOME_SHARE_SHAMELA_DIR, "shamela/app")
    if need_database:
        _tar_extract(tarball, PATH_HOME_SHARE_SHAMELA_DIR, "shamela/database")
    if need_appimage:
        _tar_extract(tarball, PATH_HOME_SHARE_SHAMELA_DIR, "shamela/shamela.AppImage")
        _ensure_exec(PATH_HOME_SHARE_SHAMELA_APPIMAGE)


def _patch_shortcut_settings() -> None:
    PATH_HOME_SHARE_SHAMELA_DATABASE_USER_DIR.mkdir(parents=True, exist_ok=True)

    db_path = PATH_HOME_SHARE_SHAMELA_DATABASE_USER_DATADB
    db_exists = db_path.exists()

    db = sqlite3.connect(db_path)
    cur = db.cursor()

    if not db_exists:
        cur.executescript(
            """
            CREATE TABLE IF NOT EXISTS db_ver (value INTEGER);
            INSERT OR IGNORE INTO db_ver VALUES(8);

            CREATE TABLE IF NOT EXISTS store (key TEXT, value TEXT);
            CREATE UNIQUE INDEX IF NOT EXISTS key ON store(key);

            CREATE TABLE IF NOT EXISTS last_viewed (
                book_id INTEGER PRIMARY KEY, page_id INTEGER, time INTEGER);
            CREATE INDEX IF NOT EXISTS view_time ON last_viewed(time);

            CREATE TABLE IF NOT EXISTS search_phrase (
                addition INTEGER PRIMARY KEY, phrase TEXT);
            CREATE UNIQUE INDEX IF NOT EXISTS phrase ON search_phrase(phrase);

            CREATE TABLE IF NOT EXISTS favorite_folder (
                folder_id INTEGER PRIMARY KEY, folder_order INTEGER,
                folder_parent INTEGER, folder_text TEXT);
            CREATE INDEX IF NOT EXISTS folder_order
                ON favorite_folder(folder_order);
            CREATE INDEX IF NOT EXISTS folder_parent
                ON favorite_folder(folder_parent);

            CREATE TABLE IF NOT EXISTS favorite_book (
                favorite_id INTEGER PRIMARY KEY, book_id INTEGER,
                folder_id INTEGER, favorite_name TEXT, favorite_order INTEGER);
            CREATE INDEX IF NOT EXISTS favorite_order
                ON favorite_book(favorite_order);

            CREATE TABLE IF NOT EXISTS scope (
                scope_id INTEGER PRIMARY KEY, scope_name TEXT,
                scope_json TEXT, scope_order INTEGER);
            CREATE INDEX IF NOT EXISTS scope_order ON scope(scope_order);

            CREATE TABLE IF NOT EXISTS search (
                search_id INTEGER PRIMARY KEY, search_name TEXT,
                search_json TEXT, search_order INTEGER);
            CREATE INDEX IF NOT EXISTS search_order ON search(search_order);

            CREATE TABLE IF NOT EXISTS session (
                session_id INTEGER PRIMARY KEY, session_name TEXT,
                session_json TEXT, session_order INTEGER);
            CREATE INDEX IF NOT EXISTS session_order ON session(session_order);

            CREATE TABLE IF NOT EXISTS last_downloaded (
                book_id INTEGER PRIMARY KEY, time INTEGER);
            CREATE TABLE IF NOT EXISTS last_downloaded_pdf (
                book_id INTEGER PRIMARY KEY, time INTEGER);
            CREATE TABLE IF NOT EXISTS diacritic (
                book_id INTEGER PRIMARY KEY, diacritic BOOLEAN);

            CREATE TABLE IF NOT EXISTS result_hash (
                context_id TEXT, hash_value TEXT);
            CREATE INDEX IF NOT EXISTS context_id ON result_hash(context_id);
            CREATE INDEX IF NOT EXISTS hash_value  ON result_hash(hash_value);

            CREATE TABLE IF NOT EXISTS search_history (
                search_id INTEGER PRIMARY KEY, search_json TEXT);
            CREATE INDEX IF NOT EXISTS search_json
                ON search_history(search_json);

            CREATE TABLE IF NOT EXISTS session_history (
                session_id INTEGER PRIMARY KEY, session_json TEXT);
            CREATE INDEX IF NOT EXISTS session_json
                ON session_history(session_json);
            """
        )

    existing = cur.execute(
        "SELECT value FROM store WHERE key = 'settings_linux'"
    ).fetchone()

    if existing is None:
        settings = {
            "shortcut_desktop": False,
            "shortcut_start": False,
        }
        cur.execute(
            "INSERT INTO store (key, value) VALUES ('settings_linux', ?)",
            (json.dumps(settings, ensure_ascii=False),),
        )
        db.commit()

    db.close()


def _needs_seed() -> bool:
    return not (
        PATH_HOME_SHARE_SHAMELA_APP_DIR.is_dir()
        and PATH_HOME_SHARE_SHAMELA_DATABASE_DIR.is_dir()
        and PATH_HOME_SHARE_SHAMELA_APPIMAGE.is_file()
    )


def _build_parser() -> argparse.ArgumentParser:
    epilog = """
Default:
  shamela [args...]
Install:
  shamela install [--seed /path/to/shamela-linux.tar.xz]  (no launch)

User data (books, annotations, settings — portable across platforms):
  ~/.local/share/shamela/database/

To carry over data from Windows or macOS, place your database/ backup at the
path above before first launch. See shamela.ws for migration instructions.

To reseed only the application files (keeps books and settings intact):
  rm -rf ~/.local/share/shamela/app ~/.local/share/shamela/shamela.AppImage
  shamela install
""".strip()

    parser = argparse.ArgumentParser(
        prog=APP_NAME,
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=epilog,
    )

    subparsers = parser.add_subparsers(dest="command")

    install = subparsers.add_parser(
        "install",
        help="seed missing artifacts",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    install.add_argument(
        "--seed",
        dest="seed_path",
        metavar="TARBALL",
        help="use a user-provided tarball",
    )

    return parser


def _contains_seed_flag(args: list[str]) -> bool:
    for item in args:
        if item == "--seed" or item.startswith("--seed="):
            return True
    return False


def install_root() -> None:
    tarball = _resolve_root_tarball()
    _info(f"installing from {tarball.name}...")
    _seed_from_tarball(tarball)
    _patch_shortcut_settings()


def install_seed(path_str: str) -> None:
    tarball = Path(path_str).expanduser()
    if not tarball.is_file():
        _die(f"missing seed tarball at {tarball}")
    _info(f"installing from seed tarball {tarball.name}...")
    _seed_from_tarball(tarball)
    _patch_shortcut_settings()


def seed_missing_root() -> None:
    tarball = _resolve_root_tarball()
    _seed_missing_from_tarball(tarball)
    _patch_shortcut_settings()


def launch(args: list[str]) -> None:
    if not PATH_HOME_SHARE_SHAMELA_APPIMAGE.is_file():
        _die("AppImage is missing; run: shamela install")
    env = os.environ.copy()
    env["APPIMAGE"] = str(PATH_HOME_SHARE_SHAMELA_APPIMAGE)
    result = subprocess.run([str(PATH_HOME_SHARE_SHAMELA_APPIMAGE), *args], env=env)
    raise SystemExit(result.returncode)


def main() -> None:
    parser = _build_parser()
    args, unknown = parser.parse_known_args()

    if args.command == "install":
        if unknown:
            _die(f"unknown install option: {unknown[0]}")

        if args.seed_path:
            install_seed(args.seed_path)
        else:
            install_root()

        _info("done")
        return

    if _contains_seed_flag(unknown):
        _die("--seed is only valid with install")

    if _needs_seed():
        seed_missing_root()

    launch(unknown)


if __name__ == "__main__":
    main()
