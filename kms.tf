// https://github.com/odanado/terraform-gcp に移したから消す
/*
resource "google_kms_key_ring" "this" {
  name     = "gcp-github-actions-oidc-sandbox"
  location = "global"
}

resource "google_kms_crypto_key" "secp256k1" {
  name     = "secp256k1-key"
  key_ring = google_kms_key_ring.this.id
  purpose  = "ASYMMETRIC_SIGN"

  version_template {
    algorithm        = "EC_SIGN_SECP256K1_SHA256"
    protection_level = "HSM"
  }
}
*/
