#!/usr/bin/env bash
# Builds the game (JumPHP) and sends the site to the server: ./deploy.sh
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
JUMPHP="${JUMPHP:-$HERE/../sapiens}"
TARGET="${TARGET:-root@ssh.mimichat.fr:/mimichatPROD/sapiens}"
(cd "$JUMPHP" && bin/jumphp build sapiens)
mkdir -p "$HERE/www/jeu"
rsync -a --delete "$JUMPHP/games/sapiens/dist/web/" "$HERE/www/jeu/"
rsync -az --delete --exclude deploy.sh --exclude .git "$HERE/" "$TARGET/"
ssh "${TARGET%%:*}" "cd ${TARGET#*:} && docker compose up -d && docker compose exec -T caddy caddy reload --config /etc/caddy/Caddyfile"
