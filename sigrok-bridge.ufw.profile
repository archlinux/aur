[sigrok-bridge]
title=Sigrok bridge (Sipeed SLogic to ngscopeclient)
description=Command port 10101 plus data port 10102 (always command port + 1). Carries
 unauthenticated SCPI/waveform traffic, so it is intended for trusted networks
 only - do not expose it on a public interface.
ports=10101,10102/tcp
