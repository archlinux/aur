#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
ZigMakeHuman aiohttp API plugin.

This plugin exposes a small HTTP/JSON/WebSocket API for MakeHuman 1 without
modifying the application core. The web server runs in its own asyncio loop
and all model mutations are dispatched back to the main Qt thread.
"""

import asyncio
import functools
import json
import os
import queue
import threading
import traceback

import getpath
import gui3d
import log
import mh

try:
    from aiohttp import WSMsgType, web
except ImportError as exc:  # pragma: no cover - handled at runtime inside MakeHuman
    WSMsgType = None
    web = None
    _AIOHTTP_IMPORT_ERROR = exc
else:
    _AIOHTTP_IMPORT_ERROR = None


PLUGIN_NAME = "ZigMakeHuman API"
PLUGIN_VERSION = "0.1.0"
CONFIG_FILENAME = "zigmkhuman_aiohttp_api.json"
HTML_FILENAME = "webui.html"

DEFAULT_CONFIG = {
    "enabled": True,
    "host": "0.0.0.0",
    "port": 18080,
    "auth_token": "",
    "allow_remote": True,
    "request_timeout_seconds": 30,
}

SERVER = None


class ApiError(Exception):
    def __init__(self, message, status=400, error_type="ApiError"):
        super(ApiError, self).__init__(message)
        self.message = message
        self.status = status
        self.error_type = error_type

    def as_payload(self):
        return {
            "ok": False,
            "error": {
                "type": self.error_type,
                "message": self.message,
            },
        }


class MainThreadInvoker(object):
    def __init__(self, timeout_seconds):
        self.timeout_seconds = timeout_seconds

    def call(self, func, *args, **kwargs):
        result_queue = queue.Queue(maxsize=1)

        def _runner():
            try:
                result_queue.put((True, func(*args, **kwargs)))
            except Exception as exc:  # pragma: no cover - depends on MakeHuman runtime state
                result_queue.put(
                    (
                        False,
                        {
                            "type": exc.__class__.__name__,
                            "message": str(exc),
                            "traceback": traceback.format_exc(),
                        },
                    )
                )

        mh.callAsyncThread(_runner)
        try:
            ok, payload = result_queue.get(timeout=self.timeout_seconds)
        except queue.Empty:
            raise ApiError(
                "Timed out waiting for MakeHuman main thread",
                status=504,
                error_type="MainThreadTimeout",
            )

        if ok:
            return payload

        log.warning("ZigMakeHuman main-thread call failed:\n%s", payload.get("traceback", ""))
        raise ApiError(
            payload.get("message", "Unknown MakeHuman error"),
            status=500,
            error_type=payload.get("type", "MakeHumanRuntimeError"),
        )


class MakeHumanBridge(object):
    def __init__(self, app):
        self.app = app
        self.api = app.mhapi

    def _human(self):
        return self.api.internals.getHuman()

    def _modifier_info(self, modifier_name):
        modifier = self._human().getModifier(modifier_name)
        if modifier is None:
            raise ApiError("Unknown modifier: %s" % modifier_name, status=404, error_type="ModifierNotFound")
        return {
            "name": modifier.fullName,
            "group": getattr(modifier, "groupName", None),
            "value": modifier.getValue(),
            "default": modifier.getDefaultValue() if hasattr(modifier, "getDefaultValue") else None,
            "min": modifier.getMin() if hasattr(modifier, "getMin") else None,
            "max": modifier.getMax() if hasattr(modifier, "getMax") else None,
        }

    def model_summary(self):
        human = self._human()
        current_file = getattr(gui3d.app, "currentFile", None)
        current_path = getattr(current_file, "path", None)
        return {
            "name": human.getName() or "",
            "uuid": human.getUuid() or "",
            "model_path": current_path or "",
            "modifier_count": len(human.getModifierNames()),
        }

    def health(self):
        summary = self.model_summary()
        summary.update(
            {
                "plugin": PLUGIN_NAME,
                "plugin_version": PLUGIN_VERSION,
                "makehuman_version": mh.getVersionStr(),
            }
        )
        return summary

    def list_modifiers(self):
        human = self._human()
        return [self._modifier_info(name) for name in sorted(human.getModifierNames())]

    def set_modifier(self, modifier_name, value):
        self.api.modifiers.applyModifier(modifier_name, float(value))
        return self._modifier_info(modifier_name)

    def set_modifiers_bulk(self, modifier_map):
        human = self._human()
        changed = []

        for modifier_name, value in sorted(modifier_map.items()):
            modifier = human.getModifier(modifier_name)
            if modifier is None:
                raise ApiError(
                    "Unknown modifier: %s" % modifier_name,
                    status=404,
                    error_type="ModifierNotFound",
                )
            modifier.setValue(float(value))
            changed.append(modifier_name)

        human.applyAllTargets()
        mh.redraw()

        return {
            "changed": changed,
            "model": self.model_summary(),
        }

    def list_assets(self, asset_type):
        asset_type = asset_type.lower()

        if asset_type == "hair":
            paths = self.api.assets.getAvailableSystemHair() + self.api.assets.getAvailableUserHair()
            equipped = self.api.assets.getEquippedHair()
        elif asset_type == "eyebrows":
            paths = self.api.assets.getAvailableSystemEyebrows() + self.api.assets.getAvailableUserEyebrows()
            equipped = self.api.assets.getEquippedEyebrows()
        elif asset_type == "eyelashes":
            paths = self.api.assets.getAvailableSystemEyelashes() + self.api.assets.getAvailableUserEyelashes()
            equipped = self.api.assets.getEquippedEyelashes()
        elif asset_type == "clothes":
            paths = self.api.assets.getAvailableSystemClothes() + self.api.assets.getAvailableUserClothes()
            equipped = self.api.assets.getEquippedClothes()
        elif asset_type == "skins":
            paths = self.api.assets.getAvailableSystemSkins() + self.api.assets.getAvailableUserSkins()
            equipped = None
        else:
            raise ApiError(
                "Unsupported asset type: %s" % asset_type,
                status=400,
                error_type="UnsupportedAssetType",
            )

        return {
            "type": asset_type,
            "count": len(paths),
            "equipped": equipped,
            "items": paths,
        }

    def equip_asset(self, asset_type, asset_path):
        asset_type = asset_type.lower()
        asset_path = os.path.abspath(asset_path)

        if not os.path.exists(asset_path):
            raise ApiError("Asset path does not exist: %s" % asset_path, status=404, error_type="AssetNotFound")

        if asset_type == "hair":
            self.api.assets.equipHair(asset_path)
        elif asset_type == "eyebrows":
            self.api.assets.equipEyebrows(asset_path)
        elif asset_type == "eyelashes":
            self.api.assets.equipEyelashes(asset_path)
        elif asset_type == "clothes":
            self.api.assets.equipClothes(asset_path)
        else:
            raise ApiError(
                "Unsupported asset type for equip: %s" % asset_type,
                status=400,
                error_type="UnsupportedAssetType",
            )

        mh.redraw()
        return {
            "type": asset_type,
            "path": asset_path,
            "model": self.model_summary(),
        }

    def save_model(self, path):
        path = os.path.abspath(path)
        if not path.endswith(".mhm"):
            path = path + ".mhm"
        os.makedirs(os.path.dirname(path), exist_ok=True)
        self._human().save(path)
        return {"path": path}

    def load_model(self, path):
        path = os.path.abspath(path)
        if not os.path.exists(path):
            raise ApiError("Model path does not exist: %s" % path, status=404, error_type="ModelNotFound")
        self._human().load(path, update=True, strict=False)
        mh.redraw()
        return {"path": path, "model": self.model_summary()}

    def export_model(self, export_format, path, use_exports_dir=False):
        export_format = export_format.lower()
        path = os.path.abspath(path)
        os.makedirs(os.path.dirname(path), exist_ok=True)

        if export_format == "obj":
            self.api.exports.exportAsOBJ(path, useExportsDir=use_exports_dir)
        elif export_format == "fbx":
            self.api.exports.exportAsFBX(path, useExportsDir=use_exports_dir)
        elif export_format in ("dae", "collada"):
            self.api.exports.exportAsDAE(path, useExportsDir=use_exports_dir)
        elif export_format == "mhx2":
            self.api.exports.exportAsMHX2(path, useExportsDir=use_exports_dir)
        else:
            raise ApiError(
                "Unsupported export format: %s" % export_format,
                status=400,
                error_type="UnsupportedExportFormat",
            )

        return {
            "format": export_format,
            "path": path,
        }


class ZigApiServerThread(threading.Thread):
    def __init__(self, app, config):
        super(ZigApiServerThread, self).__init__(name="zigmkhuman-aiohttp-api")
        self.daemon = True
        self.app = app
        self.config = config
        self.invoker = MainThreadInvoker(config["request_timeout_seconds"])
        self.bridge = MakeHumanBridge(app)
        self.loop = None
        self.runner = None
        self.site = None
        self.started = threading.Event()
        self.start_error = None
        self.websockets = set()

    def run(self):
        self.loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self.loop)

        try:
            self.loop.run_until_complete(self._start_server())
        except Exception as exc:  # pragma: no cover - depends on socket state at runtime
            self.start_error = exc
            log.warning("Failed to start ZigMakeHuman API server", exc_info=True)
            self.started.set()
            return

        self.started.set()

        try:
            self.loop.run_forever()
        finally:
            try:
                self.loop.run_until_complete(self._shutdown_server())
            finally:
                self.loop.close()

    async def _start_server(self):
        app = web.Application(middlewares=[self._request_guard])
        app.router.add_get("/", self._handle_index)
        app.router.add_get("/ws", self._handle_ws)
        app.router.add_get("/api/v1/health", self._handle_health)
        app.router.add_get("/api/v1/model", self._handle_model)
        app.router.add_get("/api/v1/modifiers", self._handle_list_modifiers)
        app.router.add_post("/api/v1/modifiers/set", self._handle_set_modifier)
        app.router.add_post("/api/v1/modifiers/bulk", self._handle_set_modifiers_bulk)
        app.router.add_get("/api/v1/assets", self._handle_list_assets)
        app.router.add_post("/api/v1/assets/equip", self._handle_equip_asset)
        app.router.add_post("/api/v1/models/save", self._handle_save_model)
        app.router.add_post("/api/v1/models/load", self._handle_load_model)
        app.router.add_post("/api/v1/exports", self._handle_export_model)

        self.runner = web.AppRunner(app)
        await self.runner.setup()
        self.site = web.TCPSite(self.runner, self.config["host"], self.config["port"])
        await self.site.start()

        log.message(
            "ZigMakeHuman API server listening on http://%s:%s",
            self.config["host"],
            self.config["port"],
        )

    async def _shutdown_server(self):
        for ws in list(self.websockets):
            try:
                await ws.close()
            except Exception:
                pass
        self.websockets.clear()

        if self.runner is not None:
            await self.runner.cleanup()
            self.runner = None

    def stop(self):
        if self.loop is None:
            return

        future = asyncio.run_coroutine_threadsafe(self._shutdown_server(), self.loop)
        try:
            future.result(timeout=5)
        except Exception:
            log.warning("Timed out while stopping ZigMakeHuman API server", exc_info=True)

        self.loop.call_soon_threadsafe(self.loop.stop)

    @web.middleware
    async def _request_guard(self, request, handler):
        try:
            self._check_remote_access(request)
            self._check_auth_token(request)
            return await handler(request)
        except ApiError as exc:
            return web.json_response(exc.as_payload(), status=exc.status)
        except Exception as exc:  # pragma: no cover - depends on runtime state
            log.warning("Unhandled ZigMakeHuman API exception", exc_info=True)
            payload = ApiError(
                str(exc),
                status=500,
                error_type=exc.__class__.__name__,
            ).as_payload()
            return web.json_response(payload, status=500)

    def _check_remote_access(self, request):
        if self.config.get("allow_remote"):
            return

        peername = None
        if request.transport is not None:
            peername = request.transport.get_extra_info("peername")

        host = None
        if isinstance(peername, tuple) and peername:
            host = peername[0]

        if host in (None, "127.0.0.1", "::1", "localhost"):
            return

        raise ApiError("Remote access is disabled", status=403, error_type="RemoteAccessDisabled")

    def _check_auth_token(self, request):
        token = self.config.get("auth_token", "").strip()
        if not token:
            return

        expected = "Bearer %s" % token
        supplied = request.headers.get("Authorization", "")
        if supplied != expected:
            raise ApiError("Missing or invalid API token", status=401, error_type="Unauthorized")

    async def _run_on_main_thread(self, func, *args, **kwargs):
        partial = functools.partial(self.invoker.call, func, *args, **kwargs)
        loop = asyncio.get_running_loop()
        return await loop.run_in_executor(None, partial)

    async def _broadcast(self, event_name, data):
        if not self.websockets:
            return

        payload = {
            "event": event_name,
            "data": data,
        }

        closed = []
        for ws in list(self.websockets):
            try:
                await ws.send_json(payload)
            except Exception:
                closed.append(ws)

        for ws in closed:
            self.websockets.discard(ws)

    def broadcast(self, event_name, data):
        if self.loop is None:
            return
        asyncio.run_coroutine_threadsafe(self._broadcast(event_name, data), self.loop)

    def _json_ok(self, data, status=200):
        return web.json_response({"ok": True, "data": data}, status=status)

    async def _handle_index(self, request):
        html_path = os.path.join(os.path.dirname(__file__), HTML_FILENAME)
        with open(html_path, "r", encoding="utf-8") as handle:
            html = handle.read()
        return web.Response(text=html, content_type="text/html")

    async def _handle_ws(self, request):
        ws = web.WebSocketResponse(heartbeat=30)
        await ws.prepare(request)
        self.websockets.add(ws)

        await ws.send_json(
            {
                "event": "welcome",
                "data": {
                    "plugin": PLUGIN_NAME,
                    "plugin_version": PLUGIN_VERSION,
                },
            }
        )

        try:
            async for msg in ws:
                if msg.type == WSMsgType.TEXT and msg.data == "ping":
                    await ws.send_json({"event": "pong", "data": {}})
                elif msg.type == WSMsgType.ERROR:
                    break
        finally:
            self.websockets.discard(ws)

        return ws

    async def _handle_health(self, request):
        data = await self._run_on_main_thread(self.bridge.health)
        return self._json_ok(data)

    async def _handle_model(self, request):
        data = await self._run_on_main_thread(self.bridge.model_summary)
        return self._json_ok(data)

    async def _handle_list_modifiers(self, request):
        data = await self._run_on_main_thread(self.bridge.list_modifiers)
        return self._json_ok(data)

    async def _handle_set_modifier(self, request):
        body = await request.json()
        data = await self._run_on_main_thread(
            self.bridge.set_modifier,
            body["modifier"],
            body["value"],
        )
        self.broadcast("modifier_changed", data)
        return self._json_ok(data)

    async def _handle_set_modifiers_bulk(self, request):
        body = await request.json()
        modifier_map = body.get("modifiers", {})
        if not isinstance(modifier_map, dict):
            raise ApiError("Field 'modifiers' must be an object", status=400, error_type="InvalidPayload")
        data = await self._run_on_main_thread(self.bridge.set_modifiers_bulk, modifier_map)
        self.broadcast("model_changed", data)
        return self._json_ok(data)

    async def _handle_list_assets(self, request):
        asset_type = request.query.get("type", "").strip()
        if not asset_type:
            raise ApiError("Missing query parameter: type", status=400, error_type="MissingParameter")
        data = await self._run_on_main_thread(self.bridge.list_assets, asset_type)
        return self._json_ok(data)

    async def _handle_equip_asset(self, request):
        body = await request.json()
        data = await self._run_on_main_thread(
            self.bridge.equip_asset,
            body["type"],
            body["path"],
        )
        self.broadcast("asset_equipped", data)
        return self._json_ok(data)

    async def _handle_save_model(self, request):
        body = await request.json()
        data = await self._run_on_main_thread(self.bridge.save_model, body["path"])
        self.broadcast("model_saved", data)
        return self._json_ok(data)

    async def _handle_load_model(self, request):
        body = await request.json()
        data = await self._run_on_main_thread(self.bridge.load_model, body["path"])
        self.broadcast("model_loaded", data)
        return self._json_ok(data)

    async def _handle_export_model(self, request):
        body = await request.json()
        data = await self._run_on_main_thread(
            self.bridge.export_model,
            body["format"],
            body["path"],
            body.get("use_exports_dir", False),
        )
        self.broadcast("model_exported", data)
        return self._json_ok(data)


def _config_path():
    return getpath.getPath(CONFIG_FILENAME)


def _load_config():
    path = _config_path()
    config = dict(DEFAULT_CONFIG)

    if not os.path.exists(path):
        try:
            with open(path, "w", encoding="utf-8") as handle:
                json.dump(config, handle, indent=2, sort_keys=True)
        except OSError:
            log.warning("Could not write ZigMakeHuman API config file: %s", path)
        return config

    try:
        with open(path, "r", encoding="utf-8") as handle:
            loaded = json.load(handle)
    except (OSError, ValueError):
        log.warning("Could not read ZigMakeHuman API config file: %s", path, exc_info=True)
        return config

    if isinstance(loaded, dict):
        config.update(loaded)
    return config


def load(app):
    global SERVER

    if web is None:
        log.warning("aiohttp is not available, ZigMakeHuman API plugin cannot start: %s", _AIOHTTP_IMPORT_ERROR)
        return

    if not hasattr(app, "mhapi"):
        log.warning("mhapi is not loaded, ZigMakeHuman API plugin cannot start")
        return

    config = _load_config()
    if not config.get("enabled", True):
        log.message("ZigMakeHuman API plugin is disabled in %s", _config_path())
        return

    SERVER = ZigApiServerThread(app, config)
    SERVER.start()
    SERVER.started.wait(timeout=10)

    if SERVER.start_error is not None:
        raise SERVER.start_error

    log.message(
        "ZigMakeHuman API plugin started on http://%s:%s",
        config["host"],
        config["port"],
    )


def unload(app):
    global SERVER

    if SERVER is None:
        return

    SERVER.stop()
    SERVER.join(timeout=10)
    SERVER = None
