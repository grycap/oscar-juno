eval `oidc-agent-service restart`
oidc-gen --pub --issuer https://aai.egi.eu/auth/realms/egi --scope "email  eduperson_entitlement eduperson_scoped_affiliation eduperson_unique_id" oscar-egi
chmod 0777 -R  /tmp/oidc-agent-service-0 

mkdir -p /var/run/secrets/egi.eu
oidc-token oscar-egi > /var/run/secrets/egi.eu/access_token