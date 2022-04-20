const childProcess = require("child_process");
const { contextBridge } = require("electron");
const readline = require("readline");

function startStockfish() {
	const proc = childProcess.exec("fairy-stockfish");
	const reader = readline.createInterface(proc.stdout);

	console.log("starting stockfish");

	reader.on("line", line => {
		const evt = new CustomEvent("stockfish-outer", {detail: line});
		window.dispatchEvent(evt);
	});

	return {
		send: line => {
			console.log("sending", line);
			proc.stdin.write(line + "\r\n");
		},
		addListener: listener => reader.on("line", listener),
		removeListener: listener => reader.off("line", listener),
		kill: () => proc.kill(),
	};
}

contextBridge.exposeInMainWorld("startStockfish", startStockfish);
