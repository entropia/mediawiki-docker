FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:346703e796ec8ce367a9411d7b755f274500cda219a2602b18f6e1cd468c2256  AS extension-base

FROM mediawiki:1.43.11@sha256:fe7fe8565a4ee862f578c9b17eec3725d6d2f2810d380b8144a614d95f764d69

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
