FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:5432c4d9bed1ea6413c75bf3746836f432c40bf1bdf14dccb4ee8c8f00065c16 AS extension-base

FROM mediawiki:1.43.11@sha256:324da5c8abe249bf7229ca6a4e0e689fab06b028eaa9f3a3820cce375611cf83

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
