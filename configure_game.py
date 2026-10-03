#!/usr/bin/env python3
"""Repair CaptureAge's game path using the environment selected by Protontricks."""
import datetime
import json
import os
import shutil
import stat
import sys
import tempfile
from pathlib import Path, PureWindowsPath


def is_game_directory(path):
    return path is not None and (path / 'AoE2DE_s.exe').is_file() and (path / 'resources').is_dir()


def linux_path(value, prefix):
    """Resolve an existing Windows setting through this prefix's drive mappings."""
    if not isinstance(value, str):
        return None
    path = PureWindowsPath(value)
    if not path.is_absolute() or len(path.drive) != 2 or path.drive[1] != ':':
        return None
    return prefix / 'dosdevices' / path.drive.lower() / Path(*path.parts[1:])


def windows_path(game, prefix):
    """Choose a mapped drive that exposes the real game directory."""
    candidates = []
    for drive in (prefix / 'dosdevices').iterdir():
        if len(drive.name) != 2 or drive.name[1] != ':' or not drive.name[0].isascii() or not drive.name[0].isalpha():
            continue
        if not drive.is_dir():
            continue
        target = drive.resolve()
        try:
            relative = game.resolve().relative_to(target)
        except ValueError:
            continue
        candidates.append((len(target.parts), drive.name, relative))
    if not candidates:
        raise ValueError('No Wine drive exposes the Steam game directory; check the prefix drive mappings.')
    _, drive, relative = max(candidates, key=lambda item: (item[0], item[1]))
    return str(PureWindowsPath(drive.upper() + '\\', *relative.parts))


def configure_game(game, prefix):
    if not prefix.is_dir():
        raise ValueError('Proton prefix is missing; launch AoE II: DE through Steam first.')
    if not is_game_directory(game):
        raise ValueError(f'AoE II: DE game files are missing at {game}; check the Steam installation or mounted drive.')

    state = prefix / 'drive_c/users/steamuser/AppData/Roaming/CaptureAge/persistedState_prod.json'
    exists = state.exists()
    data = json.loads(state.read_text(encoding='utf-8')) if exists else {}
    if not isinstance(data, dict):
        raise ValueError(f'Unexpected CaptureAge settings format in {state}; the file was left unchanged.')
    if is_game_directory(linux_path(data.get('lastUsedGameDirectory'), prefix)):
        return False

    data['lastUsedGameDirectory'] = windows_path(game, prefix)
    state.parent.mkdir(parents=True, exist_ok=True)
    if exists:
        timestamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
        backup = state.with_name(state.name + '.backup-' + timestamp)
        shutil.copy2(state, backup)
        mode = stat.S_IMODE(state.stat().st_mode)
    else:
        mode = 0o600

    # Atomically replace the JSON so a failed write cannot truncate user settings.
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', encoding='utf-8', dir=state.parent, delete=False) as output:
            temporary = Path(output.name)
            json.dump(data, output, ensure_ascii=False, indent=2)
            output.write('\n')
        temporary.chmod(mode)
        temporary.replace(state)
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)
    print(f"CaptureAge: configured game directory {data['lastUsedGameDirectory']}", file=sys.stderr)
    return True


def main():
    try:
        game = os.environ.get('STEAM_APP_PATH')
        prefix = os.environ.get('WINEPREFIX')
        if not game or not prefix:
            raise ValueError('Run this helper through the CaptureAge launcher so Protontricks can locate the game and prefix.')
        configure_game(Path(game), Path(prefix))
    except (OSError, ValueError) as error:
        print(f'CaptureAge: cannot configure the game directory: {error}', file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
