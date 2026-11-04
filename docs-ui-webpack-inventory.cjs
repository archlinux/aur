const fs = require('node:fs');
const path = require('node:path');

module.exports = class RuntimeInventory {
  constructor(filename) { this.filename = filename; }
  apply(compiler) {
    compiler.hooks.done.tap('RuntimeInventory', (stats) => {
      const compilation = stats.compilation;
      const chunks = [...compilation.chunks].map((chunk) => {
        const modules = new Map();
        function record(module) {
          if (module.resource) modules.set(module.identifier(), {
            identifier: module.identifier(), resource: module.resource,
          });
          if (module.modules) for (const child of module.modules) record(child);
        }
        for (const module of compilation.chunkGraph.getChunkModulesIterable(chunk)) record(module);
        return { name: chunk.name, files: [...chunk.files], modules: [...modules.values()] };
      });
      fs.writeFileSync(path.resolve(this.filename), JSON.stringify({
        chunks, assets: compilation.getAssets().map(({ name, info }) => ({ name, info })),
      }, null, 2) + '\n');
    });
  }
};
