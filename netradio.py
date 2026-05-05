#!/usr/bin/env python
import asyncio
import datetime as _dt
import json
import os
import signal
import subprocess
import tomllib
from pathlib import Path
from typing import Any

import httpx as _httpx

from textual import work
from textual.app import App, ComposeResult
from textual.binding import Binding
from textual.containers import Horizontal, Vertical
from textual.screen import ModalScreen
from textual.widgets import (
    Button,
    Footer,
    Header,
    Input,
    Label,
    ListItem,
    ListView,
    Static,
    TabbedContent,
    TabPane,
)

from youtubesearchpython import VideosSearch
from youtubesearchpython.core import requests as _ysp_req
from youtubesearchpython.core.constants import userAgent as _ua
from youtubesearchpython.core.constants import videoElementKey as _video_element_key
from youtubesearchpython.handlers.componenthandler import ComponentHandler


# ---- httpx 0.28+ uyumluluk yaması ----

def _p(self):
    p = (self.proxy or {}).get("https://") or (self.proxy or {}).get("http://")
    return _httpx.post(self.url, headers={"User-Agent": _ua}, json=self.data, timeout=self.timeout, proxy=p)


def _g(self):
    p = (self.proxy or {}).get("https://") or (self.proxy or {}).get("http://")
    return _httpx.get(self.url, headers={"User-Agent": _ua}, timeout=self.timeout, cookies={"CONSENT": "YES+1"}, proxy=p)


_ysp_req.RequestCore.syncPostRequest = _p
_ysp_req.RequestCore.syncGetRequest = _g


def _safe_video_component(self, element: dict, shelfTitle: str = None) -> dict:
    video = element[_video_element_key]
    video_id = self._getValue(video, ["videoId"])
    channel_id = self._getValue(
        video, ["ownerText", "runs", 0, "navigationEndpoint", "browseEndpoint", "browseId"]
    )
    title = self._getValue(video, ["title", "runs", 0, "text"]) or self._getValue(
        video, ["title", "accessibility", "accessibilityData", "label"]
    )
    component = {
        "type": "video",
        "id": video_id,
        "title": title,
        "publishedTime": self._getValue(video, ["publishedTimeText", "simpleText"]),
        "duration": self._getValue(video, ["lengthText", "simpleText"]),
        "viewCount": {
            "text": self._getValue(video, ["viewCountText", "simpleText"]),
            "short": self._getValue(video, ["shortViewCountText", "simpleText"]),
        },
        "thumbnails": self._getValue(video, ["thumbnail", "thumbnails"]),
        "richThumbnail": self._getValue(
            video, ["richThumbnail", "movingThumbnailRenderer", "movingThumbnailDetails", "thumbnails", 0]
        ),
        "descriptionSnippet": self._getValue(
            video, ["detailedMetadataSnippets", 0, "snippetText", "runs"]
        ),
        "channel": {
            "name": self._getValue(video, ["ownerText", "runs", 0, "text"]),
            "id": channel_id,
            "thumbnails": self._getValue(
                video,
                [
                    "channelThumbnailSupportedRenderers",
                    "channelThumbnailWithLinkRenderer",
                    "thumbnail",
                    "thumbnails",
                ],
            ),
            "link": f"https://www.youtube.com/channel/{channel_id}" if channel_id else None,
        },
        "accessibility": {
            "title": self._getValue(video, ["title", "accessibility", "accessibilityData", "label"]),
            "duration": self._getValue(video, ["lengthText", "accessibility", "accessibilityData", "label"]),
        },
        "link": f"https://www.youtube.com/watch?v={video_id}" if video_id else None,
        "shelfTitle": shelfTitle,
    }
    return component


ComponentHandler._getVideoComponent = _safe_video_component


# ---- Yollar ve sabitler ----

MPV_SOCKET = "/tmp/netradio-mpv.sock"
CONFIG_DIR = Path.home() / ".config" / "netradio"
STATIONS_PATH = CONFIG_DIR / "stations.toml"
STATE_PATH = CONFIG_DIR / "state.json"

HISTORY_MAX = 50

DEFAULT_STATIONS = """\
[[stations]]
name = "KRAL Pop"
url = "http://46.20.3.201:80/;"

[[stations]]
name = "Power Türk"
url = "https://live.powerapp.com.tr/powerturk/abr/playlist.m3u8"

[[stations]]
name = "Alem"
url = "https://turkmedya.radyotvonline.com/turkmedya/alemfm.stream/playlist.m3u8"

[[stations]]
name = "Joy"
url = "http://provisioning.streamtheworld.com/pls/JOY_FMAAC.pls"

[[stations]]
name = "Power"
url = "http://icast.powergroup.com.tr/PowerTurk/mpeg/128/home"

[[stations]]
name = "Slow Türk"
url = "https://radyo.duhnet.tv/slowturk"

[[stations]]
name = "Pal"
url = "http://shoutcast.radyogrup.com:1030/;"

[[stations]]
name = "Powerturk"
url = "http://mpegpowerturk.listenpowerapp.com/powerturk/mpeg/icecast.audio"
"""


# ---- Stations (TOML) ----


def load_stations() -> list[tuple[str, str]]:
    if not STATIONS_PATH.exists():
        STATIONS_PATH.parent.mkdir(parents=True, exist_ok=True)
        STATIONS_PATH.write_text(DEFAULT_STATIONS)
    with open(STATIONS_PATH, "rb") as f:
        data = tomllib.load(f)
    return [(s["name"], s["url"]) for s in data.get("stations", [])]


def save_stations(stations: list[tuple[str, str]]) -> None:
    STATIONS_PATH.parent.mkdir(parents=True, exist_ok=True)
    lines = []
    for name, url in stations:
        lines.append("[[stations]]")
        lines.append(f'name = {json.dumps(name, ensure_ascii=False)}')
        lines.append(f'url = {json.dumps(url, ensure_ascii=False)}')
        lines.append("")
    STATIONS_PATH.write_text("\n".join(lines))


# ---- State (favorites, history, volume) ----


def load_state() -> dict:
    if STATE_PATH.exists():
        try:
            return json.loads(STATE_PATH.read_text())
        except (ValueError, OSError):
            pass
    return {"favorites": [], "history": [], "volume": 80}


def save_state(state: dict) -> None:
    STATE_PATH.parent.mkdir(parents=True, exist_ok=True)
    STATE_PATH.write_text(json.dumps(state, ensure_ascii=False, indent=2))


def add_to_history(state: dict, kind: str, title: str, url: str) -> None:
    """kind: 'radio' | 'youtube' | 'discover'"""
    item = {
        "kind": kind,
        "title": title,
        "url": url,
        "at": _dt.datetime.now().strftime("%Y-%m-%d %H:%M"),
    }
    hist = state.setdefault("history", [])
    hist.insert(0, item)
    del hist[HISTORY_MAX:]
    save_state(state)


def toggle_favorite(state: dict, title: str, url: str) -> bool:
    """True = eklendi, False = kaldırıldı."""
    favs = state.setdefault("favorites", [])
    for i, f in enumerate(favs):
        if f.get("url") == url:
            favs.pop(i)
            save_state(state)
            return False
    favs.insert(0, {"title": title, "url": url})
    save_state(state)
    return True


def is_favorite(state: dict, url: str) -> bool:
    return any(f.get("url") == url for f in state.get("favorites", []))


# ---- mpv süreç + IPC ----

mpv_process: subprocess.Popen | None = None
saved_volume = 80


class PlaybackError(RuntimeError):
    pass


def _kill_mpv() -> None:
    global mpv_process
    if mpv_process and mpv_process.poll() is None:
        try:
            os.killpg(os.getpgid(mpv_process.pid), signal.SIGTERM)
            try:
                mpv_process.wait(timeout=2)
            except subprocess.TimeoutExpired:
                os.killpg(os.getpgid(mpv_process.pid), signal.SIGKILL)
        except (ProcessLookupError, OSError):
            pass
    mpv_process = None
    try:
        os.unlink(MPV_SOCKET)
    except FileNotFoundError:
        pass


def _spawn_mpv(extra: list[str], url: str) -> None:
    global mpv_process
    _kill_mpv()
    try:
        mpv_process = subprocess.Popen(
            [
                "mpv",
                f"--input-ipc-server={MPV_SOCKET}",
                f"--volume={saved_volume}",
                *extra,
                url,
            ],
            preexec_fn=os.setsid,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except FileNotFoundError as exc:
        raise PlaybackError("mpv bulunamadı. mpv paketini kurman gerekiyor.") from exc
    except OSError as exc:
        raise PlaybackError(f"mpv başlatılamadı: {exc}") from exc


def play_radio(url: str) -> None:
    _spawn_mpv(["--no-video"], url)


YOUTUBE_FORMATS = [
    ("Sadece ses (en iyi)", ["--no-video", "--ytdl-format=bestaudio"]),
    ("Video — en iyi", []),
    ("Video — 1080p", ["--ytdl-format=bestvideo[height<=1080]+bestaudio/best[height<=1080]"]),
    ("Video — 720p", ["--ytdl-format=bestvideo[height<=720]+bestaudio/best[height<=720]"]),
    ("Video — 480p", ["--ytdl-format=bestvideo[height<=480]+bestaudio/best[height<=480]"]),
    ("Video — 360p", ["--ytdl-format=bestvideo[height<=360]+bestaudio/best[height<=360]"]),
]


def play_youtube(url: str, extra_args: list[str]) -> None:
    _spawn_mpv(extra_args, url)


async def mpv_ipc(command: list[Any]) -> Any:
    try:
        reader, writer = await asyncio.wait_for(
            asyncio.open_unix_connection(MPV_SOCKET), timeout=0.5
        )
    except (FileNotFoundError, ConnectionRefusedError, OSError, asyncio.TimeoutError):
        return None
    try:
        writer.write((json.dumps({"command": command}) + "\n").encode())
        await writer.drain()
        line = await asyncio.wait_for(reader.readline(), timeout=0.5)
    except (asyncio.TimeoutError, OSError):
        return None
    finally:
        writer.close()
        try:
            await writer.wait_closed()
        except OSError:
            pass
    try:
        return json.loads(line).get("data")
    except (ValueError, AttributeError):
        return None


async def mpv_send(*command: Any) -> None:
    await mpv_ipc(list(command))


async def mpv_get_many(props: list[str]) -> dict[str, Any]:
    out = {p: None for p in props}
    try:
        reader, writer = await asyncio.wait_for(
            asyncio.open_unix_connection(MPV_SOCKET), timeout=0.5
        )
    except (FileNotFoundError, ConnectionRefusedError, OSError, asyncio.TimeoutError):
        return out
    try:
        for p in props:
            writer.write(
                (json.dumps({"command": ["get_property", p]}) + "\n").encode()
            )
        await writer.drain()
        for p in props:
            try:
                line = await asyncio.wait_for(reader.readline(), timeout=0.5)
                out[p] = json.loads(line).get("data")
            except (asyncio.TimeoutError, ValueError, AttributeError):
                pass
    except OSError:
        pass
    finally:
        writer.close()
        try:
            await writer.wait_closed()
        except OSError:
            pass
    return out


# ---- radio-browser.info ----

RADIO_BROWSER_HOST = "https://de1.api.radio-browser.info"


def radio_browser_search(query: str, limit: int = 30) -> list[dict]:
    url = f"{RADIO_BROWSER_HOST}/json/stations/search"
    params = {"name": query, "limit": limit, "hidebroken": "true", "order": "votes", "reverse": "true"}
    headers = {"User-Agent": "netradio/1.9 (https://github.com/saydut/netradio)"}
    try:
        r = _httpx.get(url, params=params, headers=headers, timeout=8)
        r.raise_for_status()
        return r.json()
    except (_httpx.HTTPError, ValueError):
        return []


# ---- Yardımcılar ----


def _fmt_time(seconds: float | int | None) -> str:
    if seconds is None or seconds < 0:
        return "--:--"
    s = int(seconds)
    if s >= 3600:
        return f"{s // 3600:d}:{(s % 3600) // 60:02d}:{s % 60:02d}"
    return f"{s // 60:02d}:{s % 60:02d}"


# ---- Modallar ----


class FormatPicker(ModalScreen[int]):
    BINDINGS = [Binding("escape", "dismiss(None)", "İptal")]

    DEFAULT_CSS = """
    FormatPicker { align: center middle; }
    FormatPicker > Vertical {
        background: $surface;
        border: tall $primary;
        padding: 1 2;
        width: 50;
        height: auto;
    }
    FormatPicker ListView { height: auto; border: none; }
    """

    def compose(self) -> ComposeResult:
        with Vertical():
            yield Label("Format seçin:")
            yield ListView(
                *[ListItem(Label(name)) for name, _ in YOUTUBE_FORMATS],
                id="format-list",
            )

    def on_list_view_selected(self, event: ListView.Selected) -> None:
        self.dismiss(event.list_view.index)


class StationAddModal(ModalScreen[tuple[str, str] | None]):
    BINDINGS = [Binding("escape", "dismiss(None)", "İptal")]

    DEFAULT_CSS = """
    StationAddModal { align: center middle; }
    StationAddModal > Vertical {
        background: $surface;
        border: tall $primary;
        padding: 1 2;
        width: 60;
        height: auto;
    }
    StationAddModal Input { margin: 1 0; }
    StationAddModal Horizontal { height: auto; align: right middle; }
    StationAddModal Button { margin-left: 1; }
    """

    def compose(self) -> ComposeResult:
        with Vertical():
            yield Label("Yeni İstasyon Ekle")
            yield Input(placeholder="İstasyon adı", id="add-name")
            yield Input(placeholder="Stream URL", id="add-url")
            with Horizontal():
                yield Button("İptal", id="add-cancel", variant="default")
                yield Button("Ekle", id="add-ok", variant="primary")

    def on_button_pressed(self, event: Button.Pressed) -> None:
        if event.button.id == "add-cancel":
            self.dismiss(None)
        elif event.button.id == "add-ok":
            self._submit()

    def on_input_submitted(self, _event: Input.Submitted) -> None:
        self._submit()

    def _submit(self) -> None:
        name = self.query_one("#add-name", Input).value.strip()
        url = self.query_one("#add-url", Input).value.strip()
        if name and url:
            self.dismiss((name, url))


class ConfirmModal(ModalScreen[bool]):
    BINDINGS = [
        Binding("escape", "dismiss(False)", "İptal"),
        Binding("y", "dismiss(True)", "Evet"),
        Binding("n", "dismiss(False)", "Hayır"),
    ]

    DEFAULT_CSS = """
    ConfirmModal { align: center middle; }
    ConfirmModal > Vertical {
        background: $surface;
        border: tall $warning;
        padding: 1 2;
        width: 50;
        height: auto;
    }
    ConfirmModal Horizontal { height: auto; align: right middle; margin-top: 1; }
    ConfirmModal Button { margin-left: 1; }
    """

    def __init__(self, message: str) -> None:
        super().__init__()
        self.message = message

    def compose(self) -> ComposeResult:
        with Vertical():
            yield Label(self.message)
            with Horizontal():
                yield Button("Hayır (n)", id="cm-no")
                yield Button("Evet (y)", id="cm-yes", variant="error")

    def on_button_pressed(self, event: Button.Pressed) -> None:
        self.dismiss(event.button.id == "cm-yes")


# ---- Görsel: Now Playing + kalın progress ----


class FatProgress(Static):
    """Yatay blok karakterlerle çizilmiş kalın ilerleme çubuğu."""

    DEFAULT_CSS = """
    FatProgress {
        height: 3;
        dock: bottom;
        padding: 1 2;
        background: $boost;
        color: $accent;
        text-style: bold;
    }
    """

    def __init__(self) -> None:
        super().__init__("")
        self.display = False
        self._pos: float = 0
        self._dur: float = 0

    def update_progress(self, pos: float, dur: float) -> None:
        if not dur or dur <= 0:
            self.update("")
            self.display = False
            return
        self.display = True
        self._pos, self._dur = pos, dur
        self._render_bar()

    def on_resize(self) -> None:
        self._render_bar()

    def _render_bar(self) -> None:
        if not self._dur or self._dur <= 0:
            return
        time_l = _fmt_time(self._pos)
        time_r = _fmt_time(self._dur)
        # Sol/sağ zaman + boşluklar + bar
        prefix = f"[b]{time_l}[/b]  "
        suffix = f"  [b]{time_r}[/b]"
        # bar genişliği = pencere - padding - prefix/suffix uzunluğu
        total_w = max(20, self.size.width - 4)  # 4 = horizontal padding
        text_w = len(time_l) + len(time_r) + 4
        bar_w = max(10, total_w - text_w)
        ratio = max(0.0, min(1.0, self._pos / self._dur))
        filled = int(bar_w * ratio)
        bar = "█" * filled + "░" * (bar_w - filled)
        pct = int(ratio * 100)
        self.update(f"{prefix}{bar}{suffix}  [dim]{pct:>3d}%[/dim]")


class NowPlaying(Static):
    def on_mount(self) -> None:
        self.set_interval(1.0, self.tick)

    async def tick(self) -> None:
        global saved_volume
        app: NetRadioApp = self.app  # type: ignore[assignment]

        if not (mpv_process and mpv_process.poll() is None):
            self.update("■  Durduruldu")
            try:
                app.query_one(FatProgress).update_progress(0, 0)
            except Exception:
                pass
            return

        props = await mpv_get_many(
            ["media-title", "pause", "time-pos", "duration", "volume", "mute"]
        )
        title = props["media-title"] or ""
        paused = props["pause"]
        position = props["time-pos"]
        duration = props["duration"]
        volume = props["volume"]
        mute = props["mute"]

        if volume is not None:
            saved_volume = int(volume)

        if not title:
            self.update("♪  Yükleniyor...")
            try:
                app.query_one(FatProgress).update_progress(0, 0)
            except Exception:
                pass
            return

        state = "⏸" if paused else "▶"
        vol_str = "🔇" if mute else (f"🔊 {int(volume)}%" if volume is not None else "")
        time_str = ""
        if duration and duration > 0:
            time_str = f"  [{_fmt_time(position)} / {_fmt_time(duration)}]"
        elif position is not None and position > 0:
            time_str = f"  [{_fmt_time(position)}]"

        fav_marker = "⭐ " if is_favorite(app.state, app.current_url or "") else ""
        self.update(f"{state}  {fav_marker}{title}{time_str}   {vol_str}")

        try:
            app.query_one(FatProgress).update_progress(position or 0, duration or 0)
        except Exception:
            pass


# ---- Ana uygulama ----


class NetRadioApp(App):
    CSS = """
    Screen { background: $surface; }

    TabbedContent { height: 1fr; }

    ListView { height: 1fr; border: tall $primary; }
    ListView > ListItem { padding: 0 2; }

    Input { margin: 1 0; }

    .status-line {
        height: 1;
        color: $text-muted;
        padding: 0 1;
    }

    NowPlaying {
        background: $primary-darken-2;
        color: $text;
        padding: 0 2;
        height: 1;
        dock: bottom;
        text-style: bold;
    }
    """

    BINDINGS = [
        Binding("space", "toggle_pause", "Duraklat"),
        Binding("s", "stop", "Durdur"),
        Binding("left", "seek(-10)", "−10s"),
        Binding("right", "seek(10)", "+10s"),
        Binding("left_square_bracket", "seek(-60)", "−60s", show=False),
        Binding("right_square_bracket", "seek(60)", "+60s", show=False),
        Binding("up", "volume(5)", "Ses+"),
        Binding("down", "volume(-5)", "Ses-"),
        Binding("m", "mute", "Sessiz"),
        Binding("f", "fav", "Favori"),
        Binding("a", "add_station", "Ekle", show=False),
        Binding("d", "delete_item", "Sil", show=False),
        Binding("q", "quit", "Çıkış"),
    ]

    def __init__(self) -> None:
        super().__init__()
        self.stations = load_stations()
        self.state = load_state()
        global saved_volume
        saved_volume = int(self.state.get("volume", 80))
        self.search_results: list[tuple[str, str]] = []
        self.discover_results: list[dict] = []
        self.current_title: str | None = None
        self.current_url: str | None = None

    def compose(self) -> ComposeResult:
        yield Header(show_clock=True)
        with TabbedContent(id="tabs"):
            with TabPane("📻 Radyo", id="radio-tab"):
                with Vertical():
                    yield Label(
                        "[b]a[/b] yeni  •  [b]d[/b] sil  •  Enter çal",
                        classes="status-line",
                    )
                    yield ListView(id="station-list")
            with TabPane("🎵 YouTube", id="youtube-tab"):
                with Vertical():
                    yield Input(placeholder="Ara ve Enter'a bas...", id="search-input")
                    yield Label("", id="search-status", classes="status-line")
                    yield ListView(id="result-list")
            with TabPane("⭐ Favoriler", id="fav-tab"):
                with Vertical():
                    yield Label(
                        "[b]d[/b] favoriden çıkar  •  Enter çal",
                        classes="status-line",
                    )
                    yield ListView(id="fav-list")
            with TabPane("🕒 Geçmiş", id="hist-tab"):
                with Vertical():
                    yield Label(
                        "Son çalanlar  •  Enter çal",
                        classes="status-line",
                    )
                    yield ListView(id="hist-list")
            with TabPane("📡 Keşfet", id="discover-tab"):
                with Vertical():
                    yield Input(
                        placeholder="radio-browser.info — istasyon ara...",
                        id="discover-input",
                    )
                    yield Label("", id="discover-status", classes="status-line")
                    yield ListView(id="discover-list")
        yield FatProgress()
        yield NowPlaying("■  Durduruldu")
        yield Footer()

    def on_mount(self) -> None:
        self._populate_stations()
        self._populate_favorites()
        self._populate_history()

    # ---- Listeleri doldur ----

    def _populate_stations(self) -> None:
        lv = self.query_one("#station-list", ListView)
        lv.clear()
        for name, _ in self.stations:
            lv.append(ListItem(Label(name)))

    def _populate_favorites(self) -> None:
        lv = self.query_one("#fav-list", ListView)
        lv.clear()
        for f in self.state.get("favorites", []):
            lv.append(ListItem(Label(f.get("title", "?"))))

    def _populate_history(self) -> None:
        lv = self.query_one("#hist-list", ListView)
        lv.clear()
        for h in self.state.get("history", []):
            kind_icon = {"radio": "📻", "youtube": "🎵", "discover": "📡"}.get(
                h.get("kind", ""), "•"
            )
            lv.append(
                ListItem(
                    Label(f"{kind_icon} {h.get('title', '?')}  [dim]{h.get('at', '')}[/dim]")
                )
            )

    def _populate_discover(self) -> None:
        lv = self.query_one("#discover-list", ListView)
        lv.clear()
        for s in self.discover_results:
            label = f"{s.get('name', '?')}  [dim]{s.get('country', '')} • {s.get('codec', '')} {s.get('bitrate', '')}k[/dim]"
            lv.append(ListItem(Label(label)))

    # ---- Liste seçimleri ----

    def on_list_view_selected(self, event: ListView.Selected) -> None:
        idx = event.list_view.index
        if idx is None:
            return
        lid = event.list_view.id

        if lid == "station-list":
            name, url = self.stations[idx]
            self._start_radio(name, url)
        elif lid == "result-list" and self.search_results:
            title, url = self.search_results[idx]
            self._pick_format_and_play(title, url)
        elif lid == "fav-list":
            favs = self.state.get("favorites", [])
            if idx < len(favs):
                f = favs[idx]
                self._pick_format_and_play(f["title"], f["url"])
        elif lid == "hist-list":
            hist = self.state.get("history", [])
            if idx < len(hist):
                h = hist[idx]
                if h["kind"] == "radio":
                    self._start_radio(h["title"], h["url"])
                else:
                    self._pick_format_and_play(h["title"], h["url"])
        elif lid == "discover-list" and self.discover_results:
            s = self.discover_results[idx]
            url = s.get("url_resolved") or s.get("url")
            if url:
                self._start_radio(s.get("name", "?"), url, kind="discover")

    def _start_radio(self, name: str, url: str, kind: str = "radio") -> None:
        self.current_title = name
        self.current_url = url
        self.query_one(NowPlaying).update(f"♪  {name} yükleniyor...")
        add_to_history(self.state, kind, name, url)
        self._populate_history()
        self.run_worker(
            lambda u=url: self._run_playback(play_radio, u),
            thread=True,
            exclusive=True,
        )

    def _pick_format_and_play(self, title: str, url: str) -> None:
        def _on_pick(fmt_idx: int | None) -> None:
            if fmt_idx is None:
                return
            _, args = YOUTUBE_FORMATS[fmt_idx]
            self.current_title = title
            self.current_url = url
            self.query_one(NowPlaying).update(f"♪  {title} yükleniyor...")
            add_to_history(self.state, "youtube", title, url)
            self._populate_history()
            self.run_worker(
                lambda u=url, a=args: self._run_playback(play_youtube, u, a),
                thread=True,
                exclusive=True,
            )

        self.push_screen(FormatPicker(), _on_pick)

    def _run_playback(self, player, *args) -> None:
        try:
            player(*args)
        except PlaybackError as exc:
            self.call_from_thread(self._show_playback_error, str(exc))

    def _show_playback_error(self, message: str) -> None:
        self.current_title = None
        self.current_url = None
        self.query_one(NowPlaying).update(f"Hata: {message}")
        self.notify(message, title="Oynatma hatası", severity="error", timeout=4)

    # ---- YouTube arama ----

    def on_input_submitted(self, event: Input.Submitted) -> None:
        term = event.value.strip()
        if not term:
            return
        if event.input.id == "search-input":
            self._do_youtube_search(term)
        elif event.input.id == "discover-input":
            self._do_discover_search(term)

    @work(thread=True)
    def _do_youtube_search(self, term: str) -> None:
        self.call_from_thread(
            self.query_one("#search-status", Label).update,
            f"🔍  '{term}' aranıyor...",
        )
        try:
            results = VideosSearch(term, limit=10).result()["result"]
            self.search_results = [
                (str(title), str(link))
                for r in results
                if (title := r.get("title")) and (link := r.get("link"))
            ]
            self.call_from_thread(self._populate_youtube_results)
        except Exception as e:
            self.call_from_thread(
                self.query_one("#search-status", Label).update,
                f"Hata: {e}",
            )

    def _populate_youtube_results(self) -> None:
        lv = self.query_one("#result-list", ListView)
        lv.clear()
        for title, _ in self.search_results:
            lv.append(ListItem(Label(title)))
        self.query_one("#search-status", Label).update(
            f"{len(self.search_results)} sonuç bulundu"
        )

    # ---- Discover (radio-browser.info) ----

    @work(thread=True)
    def _do_discover_search(self, term: str) -> None:
        self.call_from_thread(
            self.query_one("#discover-status", Label).update,
            f"🌐  '{term}' aranıyor...",
        )
        results = radio_browser_search(term)
        self.discover_results = results
        self.call_from_thread(self._populate_discover_results)

    def _populate_discover_results(self) -> None:
        self._populate_discover()
        self.query_one("#discover-status", Label).update(
            f"{len(self.discover_results)} istasyon bulundu"
        )

    # ---- Oynatma kontrolleri ----

    async def action_toggle_pause(self) -> None:
        if mpv_process and mpv_process.poll() is None:
            await mpv_send("cycle", "pause")

    async def action_stop(self) -> None:
        _kill_mpv()
        self.current_title = None
        self.current_url = None
        self.query_one(NowPlaying).update("■  Durduruldu")
        try:
            self.query_one(FatProgress).update_progress(0, 0)
        except Exception:
            pass

    async def action_seek(self, seconds: int) -> None:
        if mpv_process and mpv_process.poll() is None:
            await mpv_send("seek", seconds, "relative")

    async def action_volume(self, delta: int) -> None:
        if mpv_process and mpv_process.poll() is None:
            await mpv_send("add", "volume", delta)

    async def action_mute(self) -> None:
        if mpv_process and mpv_process.poll() is None:
            await mpv_send("cycle", "mute")

    # ---- Favori / sil / ekle ----

    def action_fav(self) -> None:
        if not self.current_title or not self.current_url:
            return
        added = toggle_favorite(self.state, self.current_title, self.current_url)
        self._populate_favorites()
        msg = "favoriye eklendi" if added else "favoriden çıkarıldı"
        self.notify(f"{self.current_title} {msg}", timeout=2)

    def action_add_station(self) -> None:
        # Sadece radyo tab'ında çalışsın
        try:
            if self.query_one(TabbedContent).active != "radio-tab":
                return
        except Exception:
            return

        def _on_done(result: tuple[str, str] | None) -> None:
            if not result:
                return
            name, url = result
            self.stations.append((name, url))
            save_stations(self.stations)
            self._populate_stations()
            self.notify(f"İstasyon eklendi: {name}", timeout=2)

        self.push_screen(StationAddModal(), _on_done)

    def action_delete_item(self) -> None:
        active = self.query_one(TabbedContent).active

        if active == "radio-tab":
            lv = self.query_one("#station-list", ListView)
            idx = lv.index
            if idx is None or idx >= len(self.stations):
                return
            name = self.stations[idx][0]

            def _confirmed(yes: bool) -> None:
                if not yes:
                    return
                self.stations.pop(idx)
                save_stations(self.stations)
                self._populate_stations()
                self.notify(f"Silindi: {name}", timeout=2)

            self.push_screen(ConfirmModal(f"'{name}' silinsin mi?"), _confirmed)

        elif active == "fav-tab":
            lv = self.query_one("#fav-list", ListView)
            idx = lv.index
            favs = self.state.get("favorites", [])
            if idx is None or idx >= len(favs):
                return
            removed = favs.pop(idx)
            save_state(self.state)
            self._populate_favorites()
            self.notify(f"Favoriden çıkarıldı: {removed.get('title', '?')}", timeout=2)

    async def action_quit(self) -> None:
        # Volume'u kaydet
        self.state["volume"] = saved_volume
        save_state(self.state)
        _kill_mpv()
        self.exit()

    def on_unmount(self) -> None:
        try:
            self.state["volume"] = saved_volume
            save_state(self.state)
        except Exception:
            pass
        _kill_mpv()


if __name__ == "__main__":
    NetRadioApp().run()
