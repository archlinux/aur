#!/usr/bin/env python3
"""Small utility for generating the relevant metadata for the PKGBUILD."""
from glob import glob
from os import cpu_count
from os.path import dirname
import shutil
from subprocess import run as run_command
import tempfile
from typing import Tuple


def parse_versions() -> Tuple[str, str]:
    """Return the old and the new version of Telegram Desktop, in this order."""
    with open("PKGBUILD", encoding="utf-8") as PKGBUILD, open(".SRCINFO", encoding="utf-8") as SRCINFO:
        old_content = SRCINFO.readlines()
        new_content = PKGBUILD.readlines()

    def fetch_value(file_lines: list[str]) -> str:
        """Fetch the value of "pkgver" from the file lines"""
        filtered_content = filter(lambda s: s.strip().startswith("pkgver"), file_lines)
        first_value_line = next(filtered_content).strip()
        # Lines are: pkgver = X, with perhaps spaces
        return first_value_line.split("=")[1].strip()

    return fetch_value(old_content), fetch_value(new_content)

def make_temp_folder() -> str:
    """Utility function for creating a temporary folder and returning its path."""
    return tempfile.mkdtemp()


def git_clone_repo(old_version: str, new_version: str, git_folder: str):
    """Fetch the Git repository with the proper parameters."""

    git_clone_command = [
        "git",
        "clone",
        # "--quiet",
        "--recurse-submodules",
        "--shallow-submodules",
        f"--shallow-since=v{old_version}",
        f"--branch=v{new_version}",
        "https://github.com/telegramdesktop/tdesktop",
        git_folder,
    ]

    cpus = cpu_count()
    if cpus is not None:
        git_clone_command.append(f"--jobs={cpus}")

    print(f"Runnng: {' '.join(git_clone_command)}")

    run_command(git_clone_command, check=True)


def fetch_submodule_data(git_repository: str, base_repo: str):
    """Return all relevant instructions for the PKGBUILLD given the repository."""
    sources: dict[str, str] = {}
    commands: list[str] = []
    parsed_folders: set[str] = set()

    def generate_repo_data(git_subrepo: str):
        """Do the heavy work for one repo and recurse for the others."""
        if git_subrepo in parsed_folders:
            print(f"# Folder already handled: {git_subrepo}, skipping ...")
        source_folder = git_subrepo.replace(git_repository, base_repo)
        print(f"# Working in {source_folder}...")

        md_sep = "::"
        """custom metadata separator"""

        git_remotes_command = run_command(
            [
                "git",
                "-C",
                git_subrepo,
                "submodule",
                "foreach",
                "--quiet",
                f'printf "$name{md_sep}" ; git remote get-url origin',
            ],
            capture_output=True,
            check=True
        )
        git_submodules_metadata = git_remotes_command.stdout.decode().splitlines()

        if git_submodules_metadata:
            commands.append(f'git -C "{source_folder}" submodule init')

        for git_submodule_data in git_submodules_metadata:
            submodule_name, git_remote = git_submodule_data.split(md_sep, maxsplit=1)

            # Fetch the unique repo name and make it easy to use
            # https://github.com/some/repo.git -> repo
            git_repo_name = (
                "submodule_" + git_remote.split("/")[-1].split(".git", maxsplit=1)[0]
            )

            if git_repo_name in sources and sources[git_repo_name] != git_remote:
                raise RuntimeError(
                    f"Multiple sources with same name {git_repo_name} but different values: "
                    f"{git_remote} != {sources[git_repo_name]}"
                )

            sources[git_repo_name] = git_remote
            commands.append(
                f'git -C "{source_folder}" config src.{submodule_name}.url "$srcdir/{git_repo_name}"'
            )

        if git_submodules_metadata:
            commands.append(f'git -C "{source_folder}" submodule update')
            commands.append("")

        parsed_folders.add(git_subrepo)

        # Recurse on lower subrepos
        found_gitmodules = glob(f"{git_subrepo}/**/.gitmodules", recursive=True)
        found_subrepos = [
            dirname(gitmodule_path) for gitmodule_path in found_gitmodules
        ]

        for found_subrepo in found_subrepos:
            if found_subrepo in parsed_folders:
                continue
            generate_repo_data(found_subrepo)

    generate_repo_data(git_repository)

    return sources, commands


def generate_metadata():
    """Main method, doing the hard work."""
    git_repo_path = make_temp_folder()

    try:
        old_version, new_version = parse_versions()

        git_clone_repo(old_version, new_version, git_repo_path)

        sources, commands = fetch_submodule_data(git_repo_path, "$srcdir/tdesktop")

        indent = " " * 4

        print("# Sources:")
        for k, v in sorted(sources.items()):
            print(indent + f'"{k}::git+{v}"')

        print("# Commands in prepare:")
        for l in commands:
            print(indent + l if l.strip() else "")

    except KeyboardInterrupt:
        print("Keyboard interrupt received, stopping our work...")
    finally:
        shutil.rmtree(git_repo_path)


if __name__ == "__main__":
    generate_metadata()
