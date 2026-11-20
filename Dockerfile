FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:79b6219d50379cd6fe9a315406e4878e74a69480063fae607722f6c6915188f2 AS extension-base

FROM mediawiki:1.43.11@sha256:9692cc01b83b4b0f9d775b0ac16ec681578f6c47fb5e67c59e6a9c204442b9f7

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
