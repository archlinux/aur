<clientConfig version="1.1">
  <emailProvider id="<?php echo($_SERVER['HTTP_HOST']); ?>">
    <domain><?php echo($_SERVER['HTTP_HOST']); ?></domain>
    <displayName><?php echo($_SERVER['HTTP_HOST']); ?></displayName>
    <displayShortName><?php echo($_SERVER['HTTP_HOST']); ?></displayShortName>
    <incomingServer type="imap">
      <hostname><?php echo($_SERVER['HTTP_HOST']); ?></hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname><?php echo($_SERVER['HTTP_HOST']); ?></hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname><?php echo($_SERVER['HTTP_HOST']); ?></hostname>    
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
</clientConfig>
