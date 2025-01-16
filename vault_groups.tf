
resource "vault_identity_group" "saml_admin" {
  name     = "rusty-group"
  type     = "external"
  policies = ["rusty-policy"]

  metadata = {
    version = "1"
  }
}

resource "vault_identity_group" "saml_dev" {
  name     = "vault-devs"
  type     = "external"
  policies = ["devs-policy"]

  metadata = {
    version = "1"
  }
}

resource "vault_identity_group_alias" "okta-admin-group-alias" {
  name           = "rusty-group"
  mount_accessor = "auth_oidc_363d78c8"
  canonical_id   = vault_identity_group.saml_admin.id
}

resource "vault_identity_group_alias" "okta-dev-group-alias" {
  name           = "vault-devs"
  mount_accessor = "auth_oidc_363d78c8"
  canonical_id   = vault_identity_group.saml_dev.id
}


resource "vault_identity_group_alias" "saml-admin-group-alias" {
  name           = "vault-admins"
  mount_accessor = "auth_saml_16a0dfa8"
  canonical_id   = vault_identity_group.saml_admin.id
}

resource "vault_identity_group_alias" "saml-dev-group-alias" {
  name           = "rusty-group2"
  mount_accessor = "auth_saml_16a0dfa8"
  canonical_id   = vault_identity_group.saml_dev.id
}