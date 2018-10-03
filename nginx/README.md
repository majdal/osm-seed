# Nginx container

This container sets up Nginx as a reverse proxy for the web and the iD editor services. Start the container by running `docker-compose up -d nginx`. 

Follow the instructions below to get SSL certificates through Let's Encrypt.

1. In your .env file, comment out or remove the `NO_SSL=#` line
2. Obtain a certificate from Let's Encrypt, using certbot. Run the following command, replacing `exmaple.com` with your own domain.

```
sudo docker run -it --rm --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            -p 80:80 certbot/certbot certonly \
            --standalone -d example.com
```

That's it!

If you have additional services, you can give them their own `server` or `location` blocks in the `nginx.conf.template` file. 

## Roadmap

- Add additional server blocks for each of the services offered by osm-seed, starting with the tile server 
- Namespacing the services in the `docker-compose.yml` and `nginx.conf` files, so that you can name your services `web`, and `db`.  