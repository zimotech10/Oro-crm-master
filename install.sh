#!/bin/sh
ENV="prod"
if [ $1 ]
then
    ENV="$1"
fi
php app/console doctrine:schema:create --env $ENV
php app/console doctrine:fixture:load --no-debug --no-interaction --env $ENV
php app/console oro:navigation:init --env $ENV
php app/console oro:entity-config:update --env $ENV
php app/console oro:entity-extend:init --env $ENV
php app/console oro:entity-extend:create --env $ENV
php app/console cache:clear --env $ENV
php app/console doctrine:schema:update --env $ENV --force
php app/console oro:search:create-index --env $ENV
php app/console assets:install web --env $ENV
php app/console assetic:dump --env $ENV
php app/console oro:assetic:dump --env $ENV
php app/console oro:translation:dump --env $ENV