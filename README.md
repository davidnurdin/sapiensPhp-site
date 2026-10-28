# sapiensPhp-site

The web site of https://sapiens.mimichat.fr : a prehistoric-themed page presenting SAPIENS
(Myriad, 1986) and hosting its PHP/WebAssembly port ([sapiensPhp](https://github.com/davidnurdin/sapiensPhp),
built with [JumPHP](https://github.com/davidnurdin/jumPhp)).

- `www/` — the static site (`www/jeu/` is the game build, produced by `deploy.sh`, not committed)
- `Caddyfile`, `docker-compose.yml` — Caddy behind Traefik (TLS passthrough, Let's Encrypt)
- `deploy.sh` — builds the game (`bin/jumphp build sapiens` in a jumPhp clone) and rsyncs the site

Game and site are GPL v3, like the original sources of SAPIENS.
