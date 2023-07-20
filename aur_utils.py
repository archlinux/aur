def get_names_and_emails(authors: list[str]) -> dict[str, str]:
    names = []
    emails = []
    for author in authors:
        parts = author.split("<")
        names.append(parts[0].strip())
        emails.append((parts[1] if len(parts) > 1 else "")[:-1])

    return {"Author": ", ".join(names), "Author-email": ", ".join(emails)}


ADDONS = {
    "portablemc_archives": {
        "Version": "2.0.0",
        "Summary": "Provides support for archived versions on archive.org manager by Omniarchive community.",
        # This will become something like '["Théo Rozier <contact@theorozier.fr>"]'
        "Authors":  ["Théo Rozier <contact@theorozier.fr>"],
    },
    "portablemc_console": {
        "Version": "2.0.0",
        "Summary": "Provide an interactive console for the Minecraft process' output. Also provide an API for other addons to customize the UI.",
        "Authors":  ["Théo Rozier <contact@theorozier.fr>"],
    },
    "portablemc_fabric": {
        "Version": "2.0.1",
        "Summary": "Start Minecraft using the Fabric mod loader using '<exec> start fabric:[<mc-version>[:<loader-version>]]'.",
        "Authors":  ["Théo Rozier <contact@theorozier.fr>"],
    },
    "portablemc_forge": {
        "Version": "2.0.1",
        "Summary": "Start Minecraft using the Forge mod loader using '<exec> start forge:[<mc-version>]'.",
        "Authors":  ["Théo Rozier <contact@theorozier.fr>"],
    },
    "portablemc_quilt": {
        "Version": "1.0.1",
        "Summary": "Start Minecraft using the Quilt mod loader using '<exec> start quilt:[<mc-version>[:<loader-version>]]'.",
        "Authors":  ["MisileLaboratory", "Théo Rozier <contact@theorozier.fr>"],
    },
}
for key in ADDONS:
    ADDONS[key].update(get_names_and_emails(ADDONS[key]["Authors"]))


def metadata(name: str) -> dict[str, str | list[str]]:
    return ADDONS[name]
