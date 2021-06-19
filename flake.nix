{
  description = "dn42 root certificates for *.dn42 and 172.22.0.0/15";
  outputs = { self }: {
    nixosModule = { config, lib, ... }: {
      options.security.pki.dn42.enable =
        lib.mkEnableOption "dn42 root certificates";

      config.security.pki.certificateFiles =
        lib.mkIf config.security.pki.dn42.enable [ ./dn42.crt ];
    };
  };
}
