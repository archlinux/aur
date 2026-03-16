#!/usr/bin/env python3

import argparse
import json
import sys
import urllib.error
import urllib.parse
import urllib.request


def request_json(base_url, method, path, payload=None):
    url = base_url.rstrip("/") + path
    data = None
    headers = {}

    if payload is not None:
        data = json.dumps(payload).encode("utf-8")
        headers["Content-Type"] = "application/json"

    request = urllib.request.Request(url, data=data, headers=headers, method=method)

    try:
        with urllib.request.urlopen(request) as response:
            body = response.read().decode("utf-8")
            return json.loads(body)
    except urllib.error.HTTPError as exc:
        body = exc.read().decode("utf-8", errors="replace")
        try:
            return json.loads(body)
        except json.JSONDecodeError:
            return {"ok": False, "error": {"type": "HTTPError", "message": body or str(exc)}}


def cmd_health(args):
    return request_json(args.base_url, "GET", "/api/v1/health")


def cmd_model(args):
    return request_json(args.base_url, "GET", "/api/v1/model")


def cmd_list_modifiers(args):
    return request_json(args.base_url, "GET", "/api/v1/modifiers")


def cmd_set_modifier(args):
    return request_json(
        args.base_url,
        "POST",
        "/api/v1/modifiers/set",
        {"modifier": args.modifier, "value": args.value},
    )


def cmd_list_assets(args):
    query = urllib.parse.urlencode({"type": args.asset_type})
    return request_json(args.base_url, "GET", "/api/v1/assets?" + query)


def cmd_equip_asset(args):
    return request_json(
        args.base_url,
        "POST",
        "/api/v1/assets/equip",
        {"type": args.asset_type, "path": args.path},
    )


def cmd_save(args):
    return request_json(args.base_url, "POST", "/api/v1/models/save", {"path": args.path})


def cmd_load(args):
    return request_json(args.base_url, "POST", "/api/v1/models/load", {"path": args.path})


def cmd_export(args):
    return request_json(
        args.base_url,
        "POST",
        "/api/v1/exports",
        {
            "format": args.export_format,
            "path": args.path,
            "use_exports_dir": args.use_exports_dir,
        },
    )


def build_parser():
    parser = argparse.ArgumentParser(description="Simple client for the ZigMakeHuman aiohttp API")
    parser.add_argument("--base-url", default="http://127.0.0.1:18080", help="API base URL")

    subparsers = parser.add_subparsers(dest="command", required=True)

    health = subparsers.add_parser("health", help="Fetch API health")
    health.set_defaults(func=cmd_health)

    model = subparsers.add_parser("model", help="Fetch current model summary")
    model.set_defaults(func=cmd_model)

    modifiers = subparsers.add_parser("list-modifiers", help="List all modifiers")
    modifiers.set_defaults(func=cmd_list_modifiers)

    set_modifier = subparsers.add_parser("set-modifier", help="Set one modifier")
    set_modifier.add_argument("modifier", help="Full modifier name")
    set_modifier.add_argument("value", type=float, help="Modifier value")
    set_modifier.set_defaults(func=cmd_set_modifier)

    assets = subparsers.add_parser("list-assets", help="List assets for one type")
    assets.add_argument("asset_type", choices=["hair", "eyebrows", "eyelashes", "clothes", "skins"])
    assets.set_defaults(func=cmd_list_assets)

    equip = subparsers.add_parser("equip-asset", help="Equip one asset")
    equip.add_argument("asset_type", choices=["hair", "eyebrows", "eyelashes", "clothes"])
    equip.add_argument("path", help="Absolute path to the asset file")
    equip.set_defaults(func=cmd_equip_asset)

    save = subparsers.add_parser("save", help="Save current model as MHM")
    save.add_argument("path", help="Destination path")
    save.set_defaults(func=cmd_save)

    load = subparsers.add_parser("load", help="Load an MHM model")
    load.add_argument("path", help="Path to an MHM file")
    load.set_defaults(func=cmd_load)

    export = subparsers.add_parser("export", help="Export current model")
    export.add_argument("export_format", choices=["obj", "fbx", "dae", "mhx2"])
    export.add_argument("path", help="Destination path")
    export.add_argument("--use-exports-dir", action="store_true", help="Use MakeHuman exports dir semantics")
    export.set_defaults(func=cmd_export)

    return parser


def main():
    parser = build_parser()
    args = parser.parse_args()
    result = args.func(args)
    json.dump(result, sys.stdout, indent=2, sort_keys=True)
    sys.stdout.write("\n")
    return 0 if result.get("ok", False) else 1


if __name__ == "__main__":
    raise SystemExit(main())
