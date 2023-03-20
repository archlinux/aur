import { Config } from "npm:pipelight";
const config: Config = {
  pipelines: [
    {
      name: "create:package",
      steps: [
        {
          name: "make AUR package (.tar.zst archive)",
          commands: ["makepkg"],
        },
      ],
    },
  ],
};
export default config;
