// ==UserScript==
// @name         ChatGPT AutoCleaner v2
// @namespace    81e29c9d-b6e3-4210-b862-c93cb160f09a
// @version      1.0
// @description  Automatically removes old messages on the ChatGPT page, keeping only the latest
// @author       Aleksey Maximov <amaxcz@gmail.com>
// @license      MIT
// @match        https://chat.openai.com/*
// @match        https://chatgpt.com/*
// @grant        none
// ==/UserScript==


(function () {
    'use strict';

    function injectUI() {
        if (document.getElementById("chatgpt-cleaner-panel")) return;

        const defaults = {
            leaveOnly: 10,
            intervalSec: 10,
            enabled: false
        };

        const stored = {
            leaveOnly: parseInt(localStorage.getItem("chatgpt-leaveOnly")) || defaults.leaveOnly,
            intervalSec: parseInt(localStorage.getItem("chatgpt-intervalSec")) || defaults.intervalSec,
            enabled: localStorage.getItem("chatgpt-enabled") !== "false"
        };

        const container = document.createElement("div");
        container.id = "chatgpt-cleaner-wrapper";
        container.style.position = "fixed";
        container.style.bottom = "8px";
        container.style.right = "8px";
        container.style.zIndex = "9999";
        container.style.fontFamily = "sans-serif";

        const toggleButton = document.createElement("button");
        toggleButton.textContent = "⚙";
        toggleButton.style.background = stored.enabled ? "#444" : "red";
        toggleButton.style.color = "#fff";
        toggleButton.style.border = "none";
        toggleButton.style.borderRadius = "4px";
        toggleButton.style.padding = "2px 6px";
        toggleButton.style.cursor = "pointer";
        toggleButton.style.fontSize = "14px";
        toggleButton.title = "Toggle cleaner panel";

        const panel = document.createElement("div");
        panel.id = "chatgpt-cleaner-panel";
        panel.style.display = "none";
        panel.style.marginTop = "4px";
        panel.style.background = "#222";
        panel.style.color = "#fff";
        panel.style.padding = "10px 12px 10px 10px";
        panel.style.borderRadius = "6px";
        panel.style.fontSize = "12px";
        panel.style.boxShadow = "0 0 6px rgba(0,0,0,0.5)";
        panel.style.border = "1px solid #555";
        panel.style.position = "relative";
        panel.style.opacity = "0.95";

        panel.innerHTML = `
            <div id="chatgpt-close" style="
                position:absolute;
                top:0px;
                right:2px;
                font-size:16px;
                font-weight:bold;
                color:#ccc;
                cursor:pointer;
            ">✖</div>
            <label>
                Keep <input id="chatgpt-keep-count" type="number" value="${stored.leaveOnly}" min="1"
                style="width:48px; min-width:48px; padding:2px 6px 2px 4px; font-size:12px; background:#111; color:#fff; border:1px solid #555; box-sizing:border-box;"> messages
            </label>
            <br>
            <label>
                Interval <input id="chatgpt-interval" type="number" value="${stored.intervalSec}" min="1"
                style="width:48px; min-width:48px; padding:2px 6px 2px 4px; font-size:12px; background:#111; color:#fff; border:1px solid #555; box-sizing:border-box;"> sec
            </label>
            <br>
            <label><input type="checkbox" id="chatgpt-enabled" ${stored.enabled ? "checked" : ""}> Auto-clean enabled</label>
        `;

        toggleButton.onclick = () => {
            panel.style.display = "block";
            toggleButton.style.display = "none";
        };

        container.appendChild(toggleButton);
        container.appendChild(panel);
        document.body.appendChild(container);

        const countInput = panel.querySelector("#chatgpt-keep-count");
        const intervalInput = panel.querySelector("#chatgpt-interval");
        const enabledCheckbox = panel.querySelector("#chatgpt-enabled");
        const closeBtn = panel.querySelector("#chatgpt-close");

        let leaveOnly = stored.leaveOnly;
        let intervalMs = stored.intervalSec * 1000;
        let enabled = stored.enabled;
        let intervalId = null;

        function cleanOldTurns() {
            if (!enabled) return;
            try {
                const all = document.querySelectorAll('[data-testid^="conversation-turn-"]');
                if (!all.length) return;
                const lastAttr = all[all.length - 1].getAttribute("data-testid");
                const last = parseInt(lastAttr?.split("-")[2]);
                if (isNaN(last)) return;

                all.forEach(item => {
                    const attr = item.getAttribute("data-testid");
                    const idx = parseInt(attr?.split("-")[2]);
                    if (!isNaN(idx) && idx < last - leaveOnly) {
                        item.remove();
                    }
                });
            } catch (e) {
                console.warn("cleanOldTurns error:", e);
            }
        }

        function startCleaner() {
            if (intervalId) clearInterval(intervalId);
            intervalId = setInterval(cleanOldTurns, intervalMs);
        }

        enabledCheckbox.onchange = () => {
            enabled = enabledCheckbox.checked;
            localStorage.setItem("chatgpt-enabled", enabled);
            toggleButton.style.background = enabled ? "#444" : "red";
        };

        countInput.oninput = () => {
            const val = parseInt(countInput.value);
            if (!isNaN(val) && val > 0) {
                leaveOnly = val;
                localStorage.setItem("chatgpt-leaveOnly", val);
            }
        };

        intervalInput.oninput = () => {
            const val = parseInt(intervalInput.value);
            if (!isNaN(val) && val > 0) {
                intervalMs = val * 1000;
                localStorage.setItem("chatgpt-intervalSec", val);
                startCleaner();
            }
        };

        closeBtn.onclick = () => {
            panel.style.display = "none";
            toggleButton.style.display = "inline-block";
        };

        startCleaner();
    }

    if (document.readyState === "complete" || document.readyState === "interactive") {
        injectUI();
    } else {
        window.addEventListener("DOMContentLoaded", injectUI);
    }

    const observer = new MutationObserver(() => {
        if (!document.getElementById("chatgpt-cleaner-wrapper")) {
            injectUI();
        }
    });

    observer.observe(document.body, {
        childList: true,
        subtree: true,
    });

})();
