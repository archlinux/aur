// Override process.resourcesPath for system electron
Object.defineProperty(process, 'resourcesPath', {
	value: __dirname,
	configurable: false,
	writable: false,
});
