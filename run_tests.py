"""Regression test suite for solo1 on modern python-fido2 (>= 2.0) and setuptools packaging."""

import unittest
from unittest.mock import MagicMock, patch

import solo
import solo.client
import solo.devices.base
import solo.devices.solo_v1
import solo.hmac_secret
from fido2.client import DefaultClientDataCollector, Fido2Client
from fido2.webauthn import PublicKeyCredentialCreationOptions


class Solo1RegressionTests(unittest.TestCase):
    def test_version_installed(self):
        """Verify solo.__version__ is populated from VERSION file."""
        self.assertEqual(solo.__version__, "0.1.1")

    def test_fido2_client_initialization_with_collector(self):
        """Verify Solo1 client initializes Fido2Client without string-origin failure."""
        dev = MagicMock()
        dev.capabilities = 0
        dev.version = 2
        solo_client = solo.devices.solo_v1.Client()
        solo_client.origin = "https://solokeys.dev"
        collector = DefaultClientDataCollector(solo_client.origin)
        fido_client = Fido2Client(dev, client_data_collector=collector)
        solo_client.client = fido_client
        self.assertIs(solo_client.get_current_fido_client(), fido_client)

    def test_make_credential_options_dict(self):
        """Verify PublicKeyCredentialCreationOptions creation from dict works in fido2 2.x."""
        options = PublicKeyCredentialCreationOptions.from_dict(
            {
                "rp": {"id": "solokeys.dev", "name": "example site"},
                "user": {"id": b"they", "name": "example user"},
                "challenge": b"Y2hhbGxlbmdl",
                "pubKeyCredParams": [
                    {"type": "public-key", "alg": -8},
                    {"type": "public-key", "alg": -7},
                ],
            }
        )
        self.assertEqual(options.rp.id, "solokeys.dev")
        self.assertEqual(options.user.id, b"they")
        self.assertEqual(len(options.pub_key_cred_params), 2)

    def test_base_make_credential_response_unpacking(self):
        """Verify make_credential unpacks RegistrationResponse (2.x) and direct attestation (1.x)."""
        solo_dev = solo.devices.base.SoloClient()
        solo_dev.host = "solokeys.dev"
        solo_dev.user_id = "testuser"

        mock_fido_client = MagicMock()
        # Simulate 2.x RegistrationResponse object
        mock_reg_response = MagicMock()
        mock_attestation = MagicMock()
        mock_client_data = MagicMock()
        mock_client_data.hash = b"hash123"
        mock_reg_response.response.attestation_object = mock_attestation
        mock_reg_response.response.client_data = mock_client_data
        mock_fido_client.make_credential.return_value = mock_reg_response

        # Mock certificate generation
        mock_cert = MagicMock()
        mock_attestation.att_stmt = {"x5c": [b"der_cert"]}

        with (
            patch.object(solo_dev, "get_current_fido_client", return_value=mock_fido_client),
            patch("cryptography.x509.load_der_x509_certificate", return_value=mock_cert),
        ):
            cert = solo_dev.make_credential()
            self.assertIs(cert, mock_cert)
            mock_attestation.verify.assert_called_once_with(b"hash123")

    def test_hmac_secret_credential_creation(self):
        """Verify solo.hmac_secret.make_credential handles 2.x RegistrationResponse."""
        mock_fido_client = MagicMock()
        mock_reg_response = MagicMock()
        mock_attestation = MagicMock()
        mock_cred_data = MagicMock()
        mock_cred_data.credential_id = b"\x01\x02\x03\x04"
        mock_attestation.auth_data.credential_data = mock_cred_data
        mock_reg_response.response.attestation_object = mock_attestation
        mock_fido_client.make_credential.return_value = mock_reg_response

        mock_find_client = MagicMock()
        mock_find_client.get_current_fido_client.return_value = mock_fido_client

        with patch("solo.client.find", return_value=mock_find_client):
            cred_id = solo.hmac_secret.make_credential(
                host="solokeys.dev", user_id="they", output=False
            )
            self.assertEqual(cred_id, b"\x01\x02\x03\x04")

    def test_hmac_secret_simple_secret_extension_results(self):
        """Verify solo.hmac_secret.simple_secret extracts output1 from client_extension_results."""
        mock_fido_client = MagicMock()
        mock_assertion = MagicMock()
        mock_assertion.client_extension_results = {
            "hmacGetSecret": {"output1": b"derived_secret_bytes_32_len__"}
        }
        mock_fido_client.get_assertion.return_value.get_response.return_value = mock_assertion

        mock_find_client = MagicMock()
        mock_find_client.get_current_fido_client.return_value = mock_fido_client

        with patch("solo.client.find", return_value=mock_find_client):
            res = solo.hmac_secret.simple_secret(
                credential_id="01020304",
                secret_input="test-input",
                host="solokeys.dev",
                output=False,
            )
            self.assertEqual(res, b"derived_secret_bytes_32_len__")


if __name__ == "__main__":
    unittest.main()
