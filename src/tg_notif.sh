#!/bin/bash

ENV=$(find . -type f -name .env)
. $ENV

# echo $TELEGRAM_USER_ID $TELEGRAM_BOT_TOKEN
TIME=$(date)
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="$TIME Build status: Success%0A%0Deploy status: $1%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null