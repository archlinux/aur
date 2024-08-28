const path = require("path");
const fs = require("fs");

const get_injected_preloads = () => {
    let injected_preloads = {};

    const liteloader_preload_content = fs.readFileSync(process.env["LITELOADERQQNT_PRELOAD"], "utf-8");

    const qqnt_application_path = path.join(process.resourcesPath, "app/application");
    const qqnt_application_content = fs.readdirSync(`${qqnt_application_path}.asar`, "utf-8");

    for (const item_name of qqnt_application_content) {
        if (!item_name.includes("preload")) continue;

        const qqnt_preload_path = path.join(qqnt_application_path, item_name);
        const qqnt_preload_content = fs.readFileSync(qqnt_preload_path, "utf-8");

        const injected_preload_content = `${liteloader_preload_content}\n{${qqnt_preload_content}}`;

        injected_preloads[item_name] = injected_preload_content;
    }

    return injected_preloads;
}

try {
    const injected_preloads = get_injected_preloads();

    fs.mkdirSync(process.env["QQNT_PRELOADS"], { recursive: true })

    for (let filename in injected_preloads) {
        fs.writeFileSync(path.join(process.env["QQNT_PRELOADS"], filename), injected_preloads[filename], { encoding: "utf-8" })
    }
    console.log("[gen_preload] finished.")

    process.exit(0)
} catch (err) {
    console.warn(err);
    console.log("[gen_preload] failed.")
    process.exit(126)
}