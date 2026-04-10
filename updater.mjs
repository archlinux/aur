#!/usr/bin/env bun

const GITHUB_API_URL = "https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest";
const PKGBUILD_FILE = "PKGBUILD";
const SRCINFO_FILE = ".SRCINFO";
const HTTP_TIMEOUT = 15;
const BUILD_TIMEOUT = 600; // 10 minutes
const USER_AGENT = "xmcl-package-updater/2.0";

// Colors
const COLOR_RESET = "\x1b[0m";
const COLOR_RED = "\x1b[91m";
const COLOR_GREEN = "\x1b[92m";
const COLOR_YELLOW = "\x1b[93m";
const COLOR_BLUE = "\x1b[94m";

class Logger {
  static #format(msg, ...args) {
    let i = 0;
    return msg.replace(/%s/g, () => args[i++] ?? "");
  }

  static success(msg, ...args) {
    console.log(`${COLOR_GREEN}✓ ${Logger.#format(msg, ...args)}${COLOR_RESET}`);
  }

  static error(msg, ...args) {
    console.error(`${COLOR_RED}✗ ${Logger.#format(msg, ...args)}${COLOR_RESET}`);
  }

  static info(msg, ...args) {
    console.log(`${COLOR_YELLOW}ℹ ${Logger.#format(msg, ...args)}${COLOR_RESET}`);
  }

  static action(msg, ...args) {
    console.log(`${COLOR_BLUE}→ ${Logger.#format(msg, ...args)}${COLOR_RESET}`);
  }
}

class Config {
  constructor(httpTimeout = HTTP_TIMEOUT, buildTimeout = BUILD_TIMEOUT) {
    this.httpTimeout = httpTimeout;
    this.buildTimeout = buildTimeout;
  }
}

class HTTPClient {
  constructor(timeout) {
    this.timeout = timeout;
  }

  async getJson(url) {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), this.timeout * 1000);

    try {
      const res = await fetch(url, {
        headers: { "User-Agent": USER_AGENT },
        signal: controller.signal,
      });

      clearTimeout(timeoutId);

      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      return await res.json();
    } catch (err) {
      clearTimeout(timeoutId);
      if (err.name === "AbortError") throw new Error("HTTP timeout");
      throw new Error(err.message);
    }
  }
}

class FileManager {
  exists(path) {
    return Bun.file(path).exists();
  }

  async readLines(path) {
    try {
      const text = await Bun.file(path).text();
      return text.split("\n");
    } catch (err) {
      throw new Error(`reading file ${path}: ${err.message}`);
    }
  }

  async writeLines(path, lines) {
    try {
      await Bun.write(path, lines.join("\n"));
    } catch (err) {
      throw new Error(`writing file ${path}: ${err.message}`);
    }
  }
}

class CommandRunner {
  async run(name, ...args) {
    const proc = Bun.spawn([name, ...args], {
      stdout: "inherit",
      stderr: "inherit",
    });
    const exitCode = await proc.exited;
    if (exitCode !== 0) {
      throw new Error(`running ${name}: exit code ${exitCode}`);
    }
  }

  async runWithOutput(name, ...args) {
    const proc = Bun.spawn([name, ...args], {
      stdout: "pipe",
      stderr: "pipe",
    });

    const [stdout, stderr] = await Promise.all([
      new Response(proc.stdout).text(),
      new Response(proc.stderr).text(),
    ]);

    const exitCode = await proc.exited;
    if (exitCode !== 0) {
      throw new Error(`running ${name}: ${stderr.trim() || "unknown error"}`);
    }
    return stdout;
  }
}

class PKGBUILDUpdater {
  constructor(fm) {
    this.fm = fm;
  }

  async updateVersion(version) {
    let lines = await this.fm.readLines(PKGBUILD_FILE);

    const versionNum = version.replace(/^v/, "");
    const pkgverRegex = /^pkgver=.*$/;
    const pkgrelRegex = /^pkgrel=.*$/;

    for (let i = 0; i < lines.length; i++) {
      const trimmed = lines[i].trim();
      if (pkgverRegex.test(trimmed)) {
        lines[i] = `pkgver=${versionNum}`;
      } else if (pkgrelRegex.test(trimmed)) {
        lines[i] = "pkgrel=1";
      }
    }

    await this.fm.writeLines(PKGBUILD_FILE, lines);
  }
}

class ReleaseChecker {
  constructor(http) {
    this.http = http;
  }

  async getLatestVersion() {
    try {
      const release = await this.http.getJson(GITHUB_API_URL);
      const tagName = release?.tag_name;
      if (!tagName) throw new Error("no tag_name in API response");
      return tagName;
    } catch (err) {
      throw new Error(`fetching latest release: ${err.message}`);
    }
  }
}

class UserInteraction {
  cancelled = false;

  async confirmBuild() {
    if (this.cancelled) return false;

    process.stdout.write("Build package now? [y/N]: ");

    const input = await new Promise((resolve) => {
      const listener = (data) => {
        process.stdin.removeListener("data", listener);
        process.stdin.pause();
        resolve(data.toString().trim().toLowerCase());
      };
      process.stdin.resume();
      process.stdin.once("data", listener);
    });

    return input === "y" || input === "yes";
  }
}

class PackageBuilder {
  buildProcess = null;

  constructor(cmd, fm) {
    this.cmd = cmd;
    this.fm = fm;
  }

  async updateChecksums() {
    await this.cmd.run("updpkgsums");
  }

  async updateSrcinfo() {
    const output = await this.cmd.runWithOutput("makepkg", "--printsrcinfo");
    await Bun.write(SRCINFO_FILE, output);
  }

  async buildPackage(timeout) {
    this.buildProcess = Bun.spawn(["makepkg", "-s"], {
      stdout: "inherit",
      stderr: "inherit",
    });

    const proc = this.buildProcess;

    try {
      await Promise.race([
        proc.exited.then((code) => {
          if (code !== 0) throw new Error(`makepkg failed with exit code ${code}`);
        }),
        new Promise((_, reject) =>
          setTimeout(() => reject(new Error("build timeout")), timeout * 1000),
        ),
      ]);
    } catch (err) {
      if (err.message === "build timeout") this.killBuild();
      throw err;
    }
  }

  killBuild() {
    if (this.buildProcess?.pid) {
      try {
        process.kill(-this.buildProcess.pid, "SIGTERM");
      } catch {}
    }
  }
}

class Application {
  cancelled = false;

  constructor(config) {
    this.config = config;
    this.fm = new FileManager();
    this.cmd = new CommandRunner();

    this.releaseChecker = new ReleaseChecker(new HTTPClient(config.httpTimeout));
    this.pkgbuildUpdater = new PKGBUILDUpdater(this.fm);
    this.packageBuilder = new PackageBuilder(this.cmd, this.fm);
    this.userInteraction = new UserInteraction();
  }

  validateEnvironment() {
    if (!this.fm.exists(PKGBUILD_FILE)) {
      throw new Error(`${PKGBUILD_FILE} not found in current directory`);
    }

    const required = ["updpkgsums", "makepkg"];
    for (const cmd of required) {
      if (!this.#commandExists(cmd)) {
        throw new Error(`required command '${cmd}' not found in PATH`);
      }
    }
  }

  #commandExists(cmd) {
    try {
      const proc = Bun.spawnSync(["sh", "-c", `command -v "${cmd}"`]);
      return proc.exitCode === 0;
    } catch {
      return false;
    }
  }

  async updatePackageFiles(version) {
    Logger.action("Updating PKGBUILD...");
    await this.pkgbuildUpdater.updateVersion(version);

    Logger.action("Updating checksums...");
    await this.packageBuilder.updateChecksums();

    Logger.action("Updating .SRCINFO...");
    await this.packageBuilder.updateSrcinfo();
  }

  async run() {
    this.validateEnvironment();

    Logger.action("Fetching latest version from GitHub...");
    const version = await this.releaseChecker.getLatestVersion();

    Logger.info("Latest version: %s", version);

    await this.updatePackageFiles(version);
    Logger.success("Package files updated to version %s", version);

    const shouldBuild = await this.userInteraction.confirmBuild();
    if (!shouldBuild) {
      Logger.info("Skipping package build");
      return;
    }

    Logger.action("Building package...");
    await this.packageBuilder.buildPackage(this.config.buildTimeout);
    Logger.success("Package built successfully!");
  }

  handleInterrupt() {
    Logger.info("Interrupt received, cancelling...");
    this.cancelled = true;
    this.userInteraction.cancelled = true;
    this.packageBuilder.killBuild();
    process.exit(1);
  }
}

async function main() {
  const config = new Config();
  const app = new Application(config);

  process.on("SIGINT", () => app.handleInterrupt());
  process.on("SIGTERM", () => app.handleInterrupt());

  try {
    await app.run();
  } catch (err) {
    Logger.error("%s", err.message);
    process.exit(1);
  }
}

main();
