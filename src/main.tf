resource "cloudflare_zone" "ammarlakis-com" {
  account_id = local.cf_account_id
  zone = "ammarlakis.com"
  plan = "free"
  type = "full"
}

resource "cloudflare_record" "ammarlakis-com" {
  zone_id = cloudflare_zone.ammarlakis-com.id
  name = "@"
  value = "ammarlakis.github.io"
  type = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www-ammarlakis-com" {
  zone_id = cloudflare_zone.ammarlakis-com.id
  name = "www"
  value = "ammarlakis.github.io"
  type = "CNAME"
  proxied = true
}

resource "cloudflare_zone_settings_override" "ammarlakis-com" {
  zone_id = cloudflare_zone.ammarlakis-com.id

  settings {
    ssl = "full"
  }
}
