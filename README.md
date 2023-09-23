# PCS Domjudge deployment
1. Clone this repo to your server and install docker-compose and certbot. Run `mkdir -p ./certbot/www` to create the certbot directory.
2. Run `docker-compose up -d` to bring the site up.
3. Due to how domjudge is written, you will need to manually acquire the site admin password (for future access to the site) and also the judgedaemon password. You will then need to edit `docker-compose.yml` and update it with the judgedaemon password, and then run `docker-compose up -d` again (note: do not run `docker-compose down`; the goal here is to restart only the judgehost container). Refer to the [domjudge Docker Hub page](https://hub.docker.com/r/domjudge/domserver/) for instructions on how to acquire these passwords.
4. Run `certbot.sh` (this acquires a certificate for the site).
5. Run `certbot_renew.sh` (this sets up a cronjob to automatically renew the site certificate).

To restart the site at any time, run `docker-compose down` followed by steps 2 and 3 to bring it back up (note that the site admin password remains the same once it is saved to the database, i.e. after the initial setup, however the judgedaemon password changes whenever the domserver is restarted).
