# vault write auth/saml/role/admin2 \
#     groups_attribute="groups" \
#     bound_subjects="*virginmediao2.com" \
#     bound_subjects_type="glob" \
#     token_policies="default","saml_policy" \
#     token_ttl="8h"

# vault write auth/saml/config   default_role="admin2"



vault auth enable saml

vault write auth/saml/config \
    idp_metadata_url="https://dev-32814529.okta.com/app/exkfh54amolFjKHZU5d7/sso/saml/metadata" \
    acs_urls="https://do-not-delete-ever-v2-public-vault-cf6a1d76.5773df81.z1.hashicorp.cloud:8200/v1/admin/auth/saml/callback" \
    entity_id="https://do-not-delete-ever-v2-public-vault-cf6a1d76.5773df81.z1.hashicorp.cloud:8200/v1/admin/auth/saml" \
    default_role="admin"


 vault write auth/saml/role/admin \
    groups_attribute="groups" \
    bound_subjects="*hashicorp.com" \
    bound_subjects_type="glob" \
    token_policies="default" \
    token_ttl="840h"

#     vault write auth/saml/role/admin3 \
#     groups_attribute="groups" \
#     bound_subjects="*rd.tc.com" \
#     bound_subjects_type="glob" \
#     token_policies="superadmin" \
#     token_ttl="840h"

# vault write auth/saml/role/admin5 \
#     bound_subjects="*" \
#     bound_subjects_type="glob" \
#     bound_attributes_type="glob" \
#     token_policies="default,saml_policy" \
#     bound_attributes=group="D-TC-RD-VAULT-HCVAUL-ADW" \
#     groups_attribute="GroupNames" \
#     ttl="8h"

vault write identity/group-alias name="vault-devs" mount_accessor="auth_saml_16a0dfa8" canonical_id="6d2dee66-f0fe-5f4c-f755-b2250debcaa0"

vault write identity/group-alias name="vault-admins" mount_accessor="auth_saml_16a0dfa8" canonical_id="161e578d-15ba-7653-38d0-e06df8ca1def"

vault write identity/group name="vault-devs-oidc" type=external policies=devs-policy

vault write identity/group name="vault-admins-oidc" type=external policies=admin-policy

vault write identity/group-alias name="vault-devs" mount_accessor="auth_oidc_363d78c8" canonical_id="3d4ba383-9ad8-a9f7-6e31-1b52de2b31b6"

vault write identity/group-alias name="vault-admins" mount_accessor="auth_oidc_363d78c8" canonical_id="a839736e-c314-b0dd-1000-954ce82c92e5"

