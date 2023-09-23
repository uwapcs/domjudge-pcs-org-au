#!/usr/bin/env bash
SLEEPTIME=$(awk 'BEGIN{srand(); print int(rand()*(3600+1))}')
echo "0 0 * * * root sleep $SLEEPTIME && certbot renew -q && (docker ps --filter \"name=^/domserver$\" --format '{{.Names}}' | grep -qw 'domserver') && docker exec -it domserver supervisorctl restart nginx" | sudo tee -a /etc/crontab > /dev/null
