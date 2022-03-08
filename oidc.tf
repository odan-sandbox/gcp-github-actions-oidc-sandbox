resource "google_service_account" "this" {
  project    = var.project_id
  account_id = "oidc-sandbox"
}

resource "google_project_iam_member" "this" {
  project = var.project_id
  role    = "roles/cloudkms.signerVerifier"
  member  = "serviceAccount:${google_service_account.this.email}"
}

module "gh_oidc" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "3.0.0"

  project_id  = var.project_id
  pool_id     = "oidc-sandbox"
  provider_id = "oidc-sandbox-gh-provider"
  sa_mapping = {
    (google_service_account.this.account_id) = {
      sa_name = google_service_account.this.name
    }
  }
}
