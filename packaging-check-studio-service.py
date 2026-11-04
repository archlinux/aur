"""Exercise the installed Studio ASGI service in fresh private state.

No model download, inference, dependency stubs or authentication bypasses.
Execute only inside the package's isolated CPU proof.
"""
from __future__ import annotations

import argparse
import hashlib
from importlib.metadata import distribution
import json
import os
from pathlib import Path
import secrets
import signal
import socket
import stat
import subprocess
import sys
import time
import threading
from urllib.error import HTTPError, URLError
from urllib.request import build_opener, HTTPRedirectHandler, ProxyHandler, Request


def installed_layout(prefix):
    dist = distribution("unsloth")
    names = {str(p) for p in dist.files or ()}
    required = {"studio/backend/main.py", "studio/frontend/dist/index.html"}
    assert required <= names, "Installed wheel lacks Studio service/frontend"
    backend = Path(dist.locate_file("studio/backend")).resolve()
    frontend = Path(dist.locate_file("studio/frontend/dist")).resolve()
    assert backend.is_relative_to(prefix) and frontend.is_relative_to(prefix)
    return backend, frontend, dist.version


def serve(fd, control_fd, prefix):
    backend, frontend, _ = installed_layout(prefix)
    sys.path.insert(0, str(backend))
    import main
    import uvicorn
    assert Path(main.__file__).resolve() == backend / "main.py"
    assert main.setup_frontend(main.app, frontend) is True
    with socket.socket(fileno=fd) as sock:
        port = sock.getsockname()[1]
        main.app.state.bind_host = "127.0.0.1"
        main.app.state.server_port = port
        main.app.state.server_request_host = "127.0.0.1"
        main.app.state.server_url = f"http://127.0.0.1:{port}"
        main.app.state.secure = False
        server = uvicorn.Server(uvicorn.Config(
            main.app, host="127.0.0.1", port=port, access_log=False,
            lifespan="on", log_level="info", timeout_graceful_shutdown=20,
        ))
        def request_shutdown():
            with os.fdopen(control_fd, "rb", buffering=0) as channel:
                message = channel.read(1)
            if message == b"q":
                server.should_exit = True
        thread = threading.Thread(target=request_shutdown, daemon=True)
        thread.start()
        server.run(sockets=[sock])
        assert server.started, "Studio never completed startup"
        assert server.lifespan.shutdown_event.is_set(), "Studio lifespan shutdown incomplete"
        assert not server.lifespan.startup_failed
        assert not server.lifespan.shutdown_failed
        assert not server.lifespan.error_occurred


class NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        raise RuntimeError("Unexpected redirect from local Studio service")


def exercise(output, prefix):
    os.umask(0o077)
    output.mkdir(mode=0o700, parents=True, exist_ok=False)
    state = output / "state"
    state.mkdir(mode=0o700)
    studio = state / "studio"
    backend, frontend, version = installed_layout(prefix)
    env = dict(os.environ)
    for key in list(env):
        if key.startswith("UNSLOTH_") or key in {"STUDIO_HOME", "HF_TOKEN", "HUGGING_FACE_HUB_TOKEN"}:
            env.pop(key)
    env.update({
        "UNSLOTH_HOME": str(state), "UNSLOTH_STUDIO_HOME": str(studio),
        "UNSLOTH_DISABLE_UPDATE_CHECK": "1", "UNSLOTH_HELPER_MODEL_DISABLE": "1",
        "UNSLOTH_DISABLE_MLX_AUTOREPAIR": "1", "UNSLOTH_STUDIO_DISABLE_TORCH_WARM": "1",
        "UNSLOTH_STUDIO_DISABLE_DIFFUSERS_PREWARM": "1",
        "XDG_CACHE_HOME": str(state / "cache"), "XDG_CONFIG_HOME": str(state / "config"),
        "XDG_DATA_HOME": str(state / "data"), "HF_HOME": str(state / "hf"),
        "HF_HUB_OFFLINE": "1", "HF_DATASETS_OFFLINE": "1", "TRANSFORMERS_OFFLINE": "1",
        "PYTHONUNBUFFERED": "1",
    })
    opener = build_opener(ProxyHandler({}), NoRedirect())
    report = {
        "status": "RUNNING", "version": version, "operations": [],
        "installed_backend": str(backend), "installed_frontend": str(frontend),
        "main_sha256": hashlib.sha256((backend / "main.py").read_bytes()).hexdigest(),
        "scope": "Installed ASGI service, authentication, frontend serving and persistent local conversations. No model training or inference.",
    }
    process = None
    service_log = None
    control_write = None
    base = None
    stage = "startup"

    def request(path, method="GET", body=None, token=None, expected=200, raw=False):
        assert path.startswith("/") and not path.startswith("//")
        headers = {"Accept": "application/json"}
        if body is not None:
            headers["Content-Type"] = "application/json"
        if token is not None:
            headers["Authorization"] = "Bearer " + token
        req = Request(base + path, data=None if body is None else json.dumps(body).encode(),
                      headers=headers, method=method)
        try:
            response = opener.open(req, timeout=30)
        except HTTPError as error:
            response = error
        with response:
            data = response.read()
            assert response.status == expected, f"Unexpected HTTP status at {stage}: {response.status}"
            return data if raw else json.loads(data)

    def start(number):
        nonlocal process, service_log, control_write, base
        service_log = (output / f"service-{number}.log").open("wb")
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
            sock.bind(("127.0.0.1", 0))
            sock.listen(128)
            base = f"http://127.0.0.1:{sock.getsockname()[1]}"
            control_read, control_write = os.pipe()
            process = subprocess.Popen(
                [sys.executable, str(Path(__file__).resolve()), "--serve", str(sock.fileno()),
                 "--control", str(control_read), "--prefix", str(prefix)],
                pass_fds=(sock.fileno(), control_read), env=env,
                cwd=output, stdout=service_log, stderr=subprocess.STDOUT, start_new_session=True,
            )
        os.close(control_read)
        deadline = time.monotonic() + 180
        while time.monotonic() < deadline:
            assert process.poll() is None, "Studio child exited during startup"
            try:
                value = request("/api/liveness")
                assert value["status"] == "alive" and value["service"] == "Unsloth UI Backend"
                return
            except (URLError, TimeoutError, ConnectionError):
                time.sleep(0.2)
        raise TimeoutError("Studio startup deadline")

    def stop(require_clean=True):
        nonlocal process, service_log, control_write
        if process is None:
            return
        if process.poll() is None:
            try:
                os.write(control_write, b"q")
            except BrokenPipeError:
                pass
            try:
                process.wait(timeout=35)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait(timeout=10)
        os.close(control_write)
        control_write = None
        code = process.returncode
        process = None
        service_log.close()
        service_log = None
        report.setdefault("server_exit_codes", []).append(code)
        if require_clean:
            assert code == 0, "Studio shutdown did not exit cleanly"

    try:
        start(1)
        stage = "health"
        health = request("/api/health")
        assert health["status"] == "healthy" and health["service"] == "Unsloth UI Backend"
        assert not {"version", "studio_version", "device_type"} & health.keys()
        assert health.get("hardware_detection_deferred") is True
        report["hardware_detection_deferred"] = True
        report["operations"].append("real_lifespan_health")

        stage = "bootstrap"
        auth = request("/api/auth/status")
        assert auth["initialized"] is True and auth["default_username"] == "unsloth"
        assert auth["requires_password_change"] is True
        bootstrap = studio / "auth/.bootstrap_password"
        assert bootstrap.is_file() and not bootstrap.is_symlink()
        assert stat.S_IMODE(bootstrap.stat().st_mode) == 0o600
        old_password = bootstrap.read_text().strip()
        assert len(old_password) >= 8
        request("/api/chat/threads", expected=401)
        request("/api/auth/login", "POST", {"username": "unsloth", "password": secrets.token_urlsafe(32)}, expected=401)
        login = request("/api/auth/login", "POST", {"username": "unsloth", "password": old_password})
        assert login["must_change_password"] is True and login["token_type"] == "bearer"
        old_token = login["access_token"]
        stage = "password_rotation"
        password = secrets.token_urlsafe(32)
        changed = request("/api/auth/change-password", "POST", {"current_password": old_password, "new_password": password}, old_token)
        assert changed["must_change_password"] is False and changed["token_type"] == "bearer"
        token = changed["access_token"]
        assert not bootstrap.exists()
        request("/api/chat/threads", token=old_token, expected=401)
        request("/api/auth/login", "POST", {"username": "unsloth", "password": old_password}, expected=401)
        report["operations"].append("bootstrap_login_password_rotation_and_old_credential_rejection")

        stage = "frontend"
        html = request("/", raw=True)
        assert b"<html" in html.lower() and b"<script" in html.lower()
        asset = next(p for p in sorted((frontend / "assets").glob("*.js")) if p.is_file())
        delivered = request("/assets/" + asset.name, raw=True)
        assert delivered == asset.read_bytes()
        report["frontend_asset"] = {"name": asset.name, "sha256": hashlib.sha256(delivered).hexdigest()}
        report["operations"].append("installed_frontend_html_and_exact_asset")

        stage = "conversation"
        thread_id, message_id = secrets.token_hex(16), secrets.token_hex(16)
        thread = {"id": thread_id, "title": "Local field notes", "modelType": "base", "modelId": "", "createdAt": int(time.time() * 1000)}
        message = {"id": message_id, "threadId": thread_id, "role": "user", "content": [{"type": "text", "text": "Measurements: north plot 12.5, south plot 9.75. Preserve these local notes."}], "createdAt": thread["createdAt"]}
        saved = request("/api/chat/threads", "POST", thread, token)
        assert all(saved[k] == v for k, v in thread.items())
        route = f"/api/chat/threads/{thread_id}/messages/{message_id}"
        saved = request(route, "PUT", message, token)
        assert all(saved[k] == v for k, v in message.items())
        saved = request(route, token=token)
        assert all(saved[k] == v for k, v in message.items())
        invalid = f"/api/chat/threads/{thread_id}/messages/{secrets.token_hex(16)}"
        request(invalid, "PUT", message, token, expected=400)
        request(invalid, token=token, expected=404)
        report["operations"].append("conversation_http_save_read_and_mismatch_rejection")
        stage = "first_shutdown"
        stop()
        assert (studio / "auth/auth.db").is_file()
        databases = sorted(studio.rglob("studio.db"))
        assert databases and all(p.resolve().is_relative_to(state) for p in databases)

        stage = "restart"
        start(2)
        auth = request("/api/auth/status")
        assert auth["initialized"] is True and auth["requires_password_change"] is False
        assert not bootstrap.exists()
        login = request("/api/auth/login", "POST", {"username": "unsloth", "password": password})
        assert login["must_change_password"] is False
        token = login["access_token"]
        saved = request(f"/api/chat/threads/{thread_id}", token=token)
        assert all(saved[k] == v for k, v in thread.items())
        saved = request(route, token=token)
        assert all(saved[k] == v for k, v in message.items())
        stop()
        report["operations"].append("clean_restart_and_persisted_conversation")
        report["status"] = "INSTALLED_STUDIO_AUTH_PERSISTENCE_AND_FRONTEND_PASS"
    except BaseException as error:
        report["status"] = "FAILED"
        report["failure"] = {"stage": stage, "type": type(error).__name__}
        raise
    finally:
        stop(require_clean=False)
        # Keep service logs only in the private remote proof. Never serialize
        # auth responses, passwords, tokens or credential-bearing HTML here.
        (output / "result.json").write_text(json.dumps(report, indent=2) + "\n")
    print("PASS: installed Studio authentication, frontend and persistent conversation workflow")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--prefix", type=Path, default=Path("/usr"))
    parser.add_argument("--output", type=Path)
    parser.add_argument("--serve", type=int)
    parser.add_argument("--control", type=int)
    args = parser.parse_args()
    if args.serve is not None:
        assert args.control is not None
        serve(args.serve, args.control, args.prefix.resolve())
    else:
        assert args.output is not None
        exercise(args.output.resolve(), args.prefix.resolve())
