terraform {
  backend "remote" {
    organization = "odan"
    workspaces {
      name = "gcp-github-actions-oidc-sandbox"
    }
  }
}
