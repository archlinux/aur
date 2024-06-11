from collections import OrderedDict
from importlib.util import spec_from_loader, module_from_spec
from importlib.machinery import SourceFileLoader
from tempfile import NamedTemporaryFile
from heapq import heappush
import sys
import requests
import base64
import re
import os


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def fetch_deps(url, rev):
    # Get the DEPS file from the given URL and revision
    if "googlesource.com" in url:
        response = requests.get(f"{url}/+/{rev}/DEPS?format=text")
        response.raise_for_status()
        return base64.b64decode(response.text).decode("utf-8")
    elif url.startswith("https://github.com/"):
        if url.endswith(".git"):
            url = url[: -len(".git")]
        response = requests.get(f"{url}/raw/{rev}/DEPS")
        response.raise_for_status()
        return response.text
    else:
        raise Exception(f"Unimplemented for URL {url}")


class Str:
    def __init__(self, s):
        self.inner = s

    def __str__(self):
        return self.inner


ignored_dep_prefix = [
    # MacOS specific
    "src/third_party/squirrel.mac",
    # Unnecessary parts
    "src/docs/website",
]


def parse_deps(path, prefix="", is_src=False, vars=None, reverse_map=None):
    """
    path: Path to the DEPS file
    prefix: Prefix to add when using recursedeps
    is_src: Whether the current DEPS file is the one from "src" repo
    vars: Override variables when generating gclient gn args file
    reverse_map: Map from url to path. Used for de-duplication
    """
    spec = spec_from_loader("deps", SourceFileLoader("deps", path))
    deps_module = module_from_spec(spec)

    def var_substitute(var_name):
        return deps_module.vars[var_name]

    deps_module.Var = var_substitute
    deps_module.Str = Str

    spec.loader.exec_module(deps_module)

    for k in (
        "checkout_win",
        "checkout_mac",
        "checkout_ios",
        "checkout_chromeos",
        "checkout_fuchsia",
        "checkout_android",
        "checkout_cxx_debugging_extension_deps",
    ):
        deps_module.vars[k] = False
    deps_module.vars["checkout_linux"] = True
    deps_module.vars["build_with_chromium"] = True
    deps_module.vars["host_os"] = "linux"
    use_relative_paths = (
        hasattr(deps_module, "use_relative_paths") and deps_module.use_relative_paths
    )

    def url_and_revision(raw_url):
        url = raw_url.format(**deps_module.vars)
        url, rev = url.rsplit("@", 1)
        if '.googlesource.com/' in url and not url.endswith(".git"):
            # Unify url format by adding .git suffix (for de-duplication)
            url += ".git"
        return (url, rev)

    def format_path(dep_name):
        return dep_name if not use_relative_paths else f"{prefix}/{dep_name}"

    real_deps = OrderedDict()
    cipd_deps = {}
    reverse_map = reverse_map or {}

    def add_dep(dep_name, raw_url):
        path = format_path(dep_name)
        for ignored_prefix in ignored_dep_prefix:
            if path.startswith(ignored_prefix):
                eprint(f"Ignoring {path}")
                return
        url, rev = url_and_revision(raw_url)
        real_deps[path] = (url, rev)
        # Add to reverse map for de-duplication, use a heap to make sure the shortest path is chosen
        heappush(reverse_map.setdefault(url, []), (len(path), path))

    for dep_name, dep_value in deps_module.deps.items():
        if isinstance(dep_value, dict):
            if "dep_type" in dep_value:
                if dep_value["dep_type"] == "cipd":
                    cipd_deps[format_path(dep_name)] = dep_value["packages"]
                else:
                    raise Exception(f"Unknown DEP {dep_name} = {dep_value}")
            else:
                if "condition" in dep_value and not eval(
                    dep_value["condition"], vars, deps_module.vars
                ):
                    eprint(
                        f"Skipping {format_path(dep_name)} because of unmet condition {dep_value['condition']}"
                    )
                    continue
                add_dep(dep_name, dep_value["url"])
        elif isinstance(dep_value, str):
            add_dep(dep_name, dep_value)
        else:
            raise Exception(f"Unknown DEP {dep_name} = {dep_value}")

    gclient_gn_args = {}
    vars = vars or {}

    if is_src and hasattr(deps_module, "gclient_gn_args"):
        for arg in deps_module.gclient_gn_args:
            # electron vars overwrites chromium vars
            gclient_gn_args[arg] = (deps_module.vars | vars).get(arg)

    if hasattr(deps_module, "recursedeps"):
        for dep in deps_module.recursedeps:
            if dep not in real_deps:
                eprint(f"Skipping recursive DEP {dep} as it's not found in deps dict")
                continue
            eprint(f"Fetching recursedep {dep}")
            deps_text = fetch_deps(*real_deps[dep])
            with NamedTemporaryFile(mode="w", delete=True) as f:
                f.write(deps_text)
                f.flush()
                dep_deps, dep_gclient_gn_args, dep_cipd_deps, _ = parse_deps(
                    f.name,
                    format_path(dep),
                    dep == "src",
                    deps_module.vars | vars,
                    reverse_map,
                )
                real_deps.update(dep_deps)
                gclient_gn_args.update(dep_gclient_gn_args)
                cipd_deps.update(dep_cipd_deps)
    return real_deps, gclient_gn_args, cipd_deps, reverse_map


repos_with_changed_url = {
    "https://chromium.googlesource.com/chromium/llvm-project/compiler-rt/lib/fuzzer.git",
    "https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf.git",
}


def get_source_path(path, url, pkgname, reverse_map):
    """returns the source path and whether it's deduplicated or not"""
    deduplicated = False
    if len(reverse_map[url]) > 1:
        # Deduplicate, choose the shortest path
        shortest = reverse_map[url][0][1]
        if path != shortest:
            eprint(f"Deduplicate:  {path} -> {shortest}")
            deduplicated = True
        path = shortest
    flattened = path.replace("/", "_")
    result = re.sub("^src", "chromium-mirror", flattened)
    if url in repos_with_changed_url:
        # To make makepkg happy when using SRCDEST
        result += f"_{pkgname}"
    return result, deduplicated


def generate_fragment(rev):
    if "." in rev:
        # Treat revisions that contain dot as tags
        return f"tag={rev}"
    else:
        return f"commit={rev}"


preferred_url_map = {
    # Replace with github mirror
    "https://chromium.googlesource.com/chromium/src.git": "https://github.com/chromium/chromium.git",
}


def get_preferred_url(url):
    preferred_url = preferred_url_map.get(url)
    return preferred_url or url


def generate_source_list(deps, indent, extra_sources, pkgname, reverse_map):
    for path, (url, rev) in deps.items():
        source_path, deduplicated = get_source_path(path, url, pkgname, reverse_map)
        if deduplicated:
            # Skip the duplicated source
            continue
        yield f"{indent}{source_path}::git+{get_preferred_url(url)}#{generate_fragment(rev)}"
    for s in extra_sources:
        yield f"{indent}{s}"


def generate_managed_scripts(deps, extra_cmds, pkgname, reverse_map):
    script = """#!/usr/bin/env rbash
set -e
# Generated file. Do not modify by hand.
# Usage: script <CARCH>
place_subproject_into_tree () {
    # place_subproject_into_tree flattened_path path should_copy
    local parent_dir="$(dirname "$2")"
    if [[ -n "$parent_dir" ]]; then
        mkdir -p "$parent_dir"
    fi
    # Remove the target dir
    rm -rf "$2"
    if [[ "$3" == "true" ]]; then
        cp -r "$1" "$2"
    else
        mv -v "$1" "$2"
    fi
}

CARCH="$1"
case "$CARCH" in
    x86_64)
        _go_arch=amd64;;
    *)
        _go_arch="$CARCH";;
esac

"""
    for path, (url, rev) in deps.items():
        source_path, deduplicated = get_source_path(path, url, pkgname, reverse_map)
        if deduplicated:
            shortest = reverse_map[url][0][1]
            script += f"place_subproject_into_tree {shortest} {path} true\n"
            script += f"git -C {path} checkout --detach {rev}\n"
        else:
            script += f"place_subproject_into_tree {source_path} {path} false\n"
    # Additional Commands
    script += "\n".join(extra_cmds)
    filename = "prepare-electron-source-tree.sh"
    with open(filename, "w") as f:
        f.write(script)
    return filename


def update_pkgbuild(real_deps, reverse_map, extra_sources):
    with open("PKGBUILD", "r") as f:
        pkgbuild = f.read()
    res = re.search(
        "([ \t]*)# BEGIN managed sources\n((.|\n)*)([ \t]*)# END managed sources",
        pkgbuild,
        re.MULTILINE,
    )
    if res is None:
        raise Exception("managed sources not found")
    indent = res.group(1)
    span = res.span(2)
    pkgbuild = (
        pkgbuild[: span[0]]
        + "\n".join(
            generate_source_list(real_deps, indent, extra_sources, pkgname, reverse_map)
        )
        + "\n"
        + indent
        + pkgbuild[span[1] :]
    )

    with open("PKGBUILD", "w") as f:
        f.write(pkgbuild)


def pyobj_to_gn_arg(k, v):
    if isinstance(v, Str):
        return f'{k} = "{v.inner}"'
    elif isinstance(v, str):
        return f'{k} = "{v}"'
    elif isinstance(v, bool):
        return f"{k} = {'true' if v else 'false'}"
    else:
        raise Exception(f"Cannot convert {k}={v} ({type(v)})to gn arg")


def generate_gclient_args(args):
    """
    Writes gclient_args.gni
    Returns command to copy it
    """
    with open("gclient_args.gni", "w") as f:
        f.writelines(pyobj_to_gn_arg(k, v) + "\n" for k, v in args.items())

    return "cp gclient_args.gni src/build/config/gclient_args.gni"


def cipd_path_substitute(cipd_path):
    # Assume PKGBUILD provides _go_arch variable
    return cipd_path.replace("${{platform}}", "linux-${_go_arch}").replace(
        "${{arch}}", "${_go_arch}"
    )


def generate_cipd_cmds(cipd_deps, enabled_deps):
    for dep, is_optional in enabled_deps:
        packages = cipd_deps.get(dep)
        if packages is None:
            if is_optional:
                continue
            else:
                raise f"cipd dependency {dep} not found"
        for package in packages:
            yield f"cipd install {cipd_path_substitute(package['package'])} {package['version']} -root {dep}"


if __name__ == "__main__":
    if len(sys.argv) != 4:
        eprint(f"Usage: {sys.argv[0]} ACTION PATH_OR_ELECTRON_VERSION PKGNAME")
        sys.exit(1)
    action = sys.argv[1]
    deps_path = sys.argv[2]
    pkgname = sys.argv[3]
    assert action in ("print", "update", "generate")
    if not os.path.exists(deps_path):
        # Get it from web
        response = requests.get(
            f"https://github.com/electron/electron/raw/{deps_path}/DEPS"
        )
        response.raise_for_status()
        deps_text = response.text
        with NamedTemporaryFile(mode="w", delete=True) as f:
            f.write(deps_text)
            f.flush()
            git_deps, gargs, cipd_deps, reverse_map = parse_deps(f.name)
    else:
        git_deps, gargs, cipd_deps, reverse_map = parse_deps(deps_path)
    if action == "print":
        for name, value in git_deps.items():
            print(f"git: {name} = {value}")
        for name, value in cipd_deps.items():
            print(f"cipd: {name} = {value}")
    elif action == "update":
        update_pkgbuild(git_deps, reverse_map, [])
    elif action == "generate":
        garg_cmd = generate_gclient_args(gargs)
        # cipd dependencies are usually binary blobs. Only add the necessary parts.
        cipd_cmds = generate_cipd_cmds(
            cipd_deps,
            [
                # (dependency path, is_optional)
                (
                    "src/third_party/screen-ai/linux",
                    True,
                ),  # only for new electron versions (probably >= 29)
                # The esbuild version 0.14.13 is not compatible with the system one
                ("src/third_party/devtools-frontend/src/third_party/esbuild", False),
            ],
        )
        managed_script = generate_managed_scripts(
            git_deps, [garg_cmd] + list(cipd_cmds), pkgname, reverse_map
        )
    print("Done")
