

from __future__ import annotations
import os, sys, re, shutil, subprocess, argparse, time, random, io
from pathlib import Path
from typing import List, Optional
from concurrent.futures import ThreadPoolExecutor, as_completed

try:
    import requests
except ImportError:
    print("ERROR: requests not installed. Run: pip install requests --break-system-packages")
    sys.exit(1)

try:
    from bs4 import BeautifulSoup
except ImportError:
    print("ERROR: beautifulsoup4 not installed. Run: pip install beautifulsoup4 --break-system-packages")
    sys.exit(1)

try:
    from ua_generator import generate as gen_ua
    def random_ua(): return gen_ua().text
except ImportError:
    def random_ua(): return "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"


MANGA_DIR = Path.home() / "manga-downloads"
DEVICE     = "KPW5"
BASE_URL   = "https://weebcentral.com"

MANGA_DIR.mkdir(parents=True, exist_ok=True)


class NetworkError(Exception): pass
class ParsingError(Exception): pass

class Network:
    MAX_RETRIES = 3
    TIMEOUT = 60

    def __init__(self):
        self.session = requests.Session()

    def get(self, url, params=None):
        headers = {"User-Agent": random_ua()}
        for attempt in range(self.MAX_RETRIES):
            try:
                r = self.session.get(url, params=params, headers=headers, timeout=self.TIMEOUT)
                r.raise_for_status()
                return r
            except requests.exceptions.RequestException as e:
                if attempt == self.MAX_RETRIES - 1:
                    raise NetworkError(f"Failed: {url} -- {e}")
                time.sleep(random.uniform(0.5, 1))

    def post(self, url, data=None):
        headers = {"User-Agent": random_ua()}
        r = self.session.post(url, data=data, headers=headers, timeout=self.TIMEOUT)
        r.raise_for_status()
        return r

    def soup(self, url, params=None):
        try:
            return BeautifulSoup(self.get(url, params).text, "html.parser")
        except Exception as e:
            raise ParsingError(f"Failed to parse {url} -- {e}")

    def thread(self, funcs, max_workers=15):
        try:
            with ThreadPoolExecutor(max_workers=max_workers) as ex:
                futures = [ex.submit(f) for f in funcs]
                for future in as_completed(futures):
                    future.result()
            return True
        except Exception:
            return False

net = Network()


class Page:
    def __init__(self, index: int, url: str):
        self.index = index
        self.url = url
        self.data: bytes = b""

    def fetch(self):
        self.data = net.get(self.url).content


class Chapter:
    def __init__(self, index: str, url: str, season: int = 0):
        self.index = index
        self.url = url
        self.season = season

    def get_pages(self) -> List[Page]:
        s = net.soup(self.url + "/images", {"is_prev": "False", "reading_style": "long_strip"})
        pages = []
        for i, img in enumerate(s.find_all("img"), 1):
            url = img.get("src", "")
            if url and re.search(r"\.(jpg|png|webp)", url):
                pages.append(Page(i, url))
        return pages

    def download_pages(self) -> List[Page]:
        pages = self.get_pages()
        net.thread([p.fetch for p in pages])
        pages.sort(key=lambda p: p.index)
        return pages


class Manga:
    def __init__(self, url: str, title: str, series_id: str):
        self.url = url
        self.title = title
        self.series_id = series_id

    def get_chapters(self) -> List[Chapter]:
        s = net.soup(f"{BASE_URL}/series/{self.series_id}/full-chapter-list")
        chapters = []
        seen = set()
        for a in s.find_all("a", href=re.compile(r"/chapters/")):
            href = a.get("href", "")
            ch_id = href.rstrip("/").split("/")[-1]
            if ch_id in seen:
                continue
            seen.add(ch_id)
            text = a.get_text(strip=True)
            m = re.search(r"[\d.]+", text)
            ch_num = m.group(0) if m else ch_id
            season_m = re.search(r"[Ss]eason\s*(\d+)", text)
            season = int(season_m.group(1)) if season_m else 0
            chapters.append(Chapter(ch_num, f"{BASE_URL}/chapters/{ch_id}", season))
        chapters.reverse()
        return chapters


def search(query: str) -> List[Manga]:
    r = net.post(f"{BASE_URL}/search/simple?location=main", data={"text": query})
    s = BeautifulSoup(r.text, "html.parser")
    results = []
    seen = set()
    for a in s.find_all("a", href=re.compile(r"/series/")):
        href = a.get("href", "")
        m = re.search(r"/series/([^/]+)/([^/\"]+)", href)
        if m and m.group(1) not in seen:
            seen.add(m.group(1))
            series_id = m.group(1)
            title = m.group(2).replace("-", " ")
            url = f"{BASE_URL}/series/{series_id}/{m.group(2)}"
            results.append(Manga(url, title, series_id))
    return results


def fzf(items: List[str], prompt: str, multi=False, header=None) -> List[str]:
    args = ["fzf", f"--prompt={prompt}", "--height=40%", "--border"]
    if multi:
        args.append("--multi")
    if header:
        args += ["--header", header]
    r = subprocess.run(args, input="\n".join(items), capture_output=True, text=True)
    if r.returncode != 0:
        return []
    return r.stdout.strip().splitlines()


def save_pages(pages: List[Page], dest: Path):
    dest.mkdir(parents=True, exist_ok=True)
    for page in pages:
        ext = page.url.split(".")[-1].split("?")[0]
        if ext not in ("jpg", "jpeg", "png", "webp"):
            ext = "jpg"
        (dest / f"{page.index:04d}.{ext}").write_bytes(page.data)


def to_cbz(src_dir: Path) -> Path:
    cbz = src_dir.with_suffix(".cbz")
    images = sorted(src_dir.iterdir())
    subprocess.run(["zip", "-j", "-q", str(cbz)] + [str(i) for i in images], check=True)
    shutil.rmtree(src_dir)
    return cbz


def to_kindle(src_dir: Path, fmt: str, dest_dir: Path = MANGA_DIR) -> Optional[Path]:
    images = sorted(src_dir.iterdir())
    if not images:
        return None
    pdf = src_dir.with_suffix(".pdf")
    subprocess.run(["magick"] + [str(i) for i in images] + [str(pdf)],
                   check=True, capture_output=True)
    subprocess.run(["kcc-c2e", "-p", DEVICE, "-m", "-q", "-f", fmt, str(pdf)], check=True)
    out = next((f for f in pdf.parent.iterdir()
                if f.suffix.lower() == f".{fmt.lower()}" and f != pdf), None)
    if out:
        final = dest_dir / out.name
        shutil.move(str(out), str(final))
        out = final
    shutil.rmtree(src_dir)
    pdf.unlink(missing_ok=True)
    return out


def main():
    parser = argparse.ArgumentParser(prog="cli-manga")
    parser.add_argument("-d", "--download", action="store_true",
                        help="Download mode only, skip read/download prompt")
    args = parser.parse_args()

    for dep in ["fzf", "magick", "kcc-c2e"]:
        if not shutil.which(dep):
            print(f"ERROR: {dep} is not installed.", file=sys.stderr)
            sys.exit(1)

    print("cli-manga\n")

    fmt = "MOBI"
    if args.download:
        fmt_choice = fzf(["MOBI", "EPUB", "CBZ", "PDF"], prompt="Output format > ")
        if not fmt_choice:
            print("ERROR: No format selected.", file=sys.stderr); sys.exit(1)
        fmt = fmt_choice[0]

    try:
        query = input("Search manga: ").strip()
    except (EOFError, KeyboardInterrupt):
        sys.exit(0)
    if not query:
        print("ERROR: No query entered.", file=sys.stderr); sys.exit(1)

    print("Searching Weebcentral...")
    results = search(query)
    if not results:
        print("ERROR: No results found.", file=sys.stderr); sys.exit(1)

    selected = fzf([m.title for m in results], prompt="Select manga > ")
    if not selected:
        sys.exit(0)
    manga = next(m for m in results if m.title == selected[0])
    print(f"\nFound: {manga.title}")

    print("Fetching chapter list...")
    chapters = manga.get_chapters()
    if not chapters:
        print("ERROR: No chapters found.", file=sys.stderr); sys.exit(1)
    print(f"{len(chapters)} chapters available.\n")

    ch_labels = [f"Chapter {c.index}" for c in chapters]
    sel_labels = fzf(ch_labels, prompt="Select chapters > ", multi=True,
                     header="TAB=select  ENTER=confirm  type to search")
    if not sel_labels:
        sys.exit(0)

    sel_chapters = [c for c, lbl in zip(chapters, ch_labels) if lbl in sel_labels]

    if args.download:
        mode = "download"
    else:
        mode = "read"

    safe_title = re.sub(r"[^a-zA-Z0-9_-]", "_", manga.title)
    work_dir = MANGA_DIR / safe_title

    for chapter in sel_chapters:
        label = f"Chapter {chapter.index}"
        safe_label = re.sub(r"[^a-zA-Z0-9._-]", "_", label)
        dest = work_dir / safe_label

        print(f"Downloading {label}...")
        pages = chapter.download_pages()
        if not pages:
            print(f"  warning: no pages found, skipping.")
            continue

        save_pages(pages, dest)

        if mode == "read":
            import tempfile
            tmp = Path(tempfile.mkdtemp())
            cbz = tmp / f"{safe_label}.cbz"
            images = sorted(dest.iterdir())
            subprocess.run(["zip", "-j", "-q", str(cbz)] + [str(i) for i in images], check=True)
            shutil.rmtree(dest)
            print(f"Opening {label} in Okular...")
            subprocess.run(["okular", str(cbz)])
            shutil.rmtree(tmp)
        else:
            print(f"Converting {label}...")
            if fmt == "CBZ":
                cbz = to_cbz(dest)
                final = work_dir / cbz.name
                shutil.move(str(cbz), str(final))
                print(f"  {label} -> {final.name}")
            elif fmt == "PDF":
                images = sorted(dest.iterdir())
                pdf = work_dir / f"{safe_label}.pdf"
                subprocess.run(["magick"] + [str(i) for i in images] + [str(pdf)],
                               check=True, capture_output=True)
                shutil.rmtree(dest)
                print(f"  {label} -> {pdf.name}")
            else:
                out = to_kindle(dest, fmt, work_dir)
                print(f"  {label} -> {out.name if out else 'done'}")

    if mode == "download":
        print(f"\ndone. saved to {work_dir}")

if __name__ == "__main__":
    main()
