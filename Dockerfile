FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:33b7c6e472cd73c56fe7e32eee99d4c610a4c36ffd5a118c16a71e06c66946b0 AS extension-base

FROM mediawiki:1.43.11@sha256:324da5c8abe249bf7229ca6a4e0e689fab06b028eaa9f3a3820cce375611cf83

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
