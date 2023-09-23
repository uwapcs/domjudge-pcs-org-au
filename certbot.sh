#!/usr/bin/env bash
certbot certonly -v --webroot -w /root/certbot/www --force-renewal --email uwapcs@gmail.com -d domjudge.pcs.org.au --agree-tos
