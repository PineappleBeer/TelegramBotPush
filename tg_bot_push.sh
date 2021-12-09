#!/bin/bash

set -u

tgMsg=$*

TG_PROXY_HOST='192.168.10.1'
TG_PROXY_PORT=1088
TG_API_HOST='api.telegram.org'
TG_USER_ID=0000000000
TG_BOT_TOKEN='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
TG_URL="https://$TG_API_HOST/bot$TG_BOT_TOKEN/sendMessage"

tgpush=$(curl --compressed -k -X POST -L -x "$TG_PROXY_HOST":"$TG_PROXY_PORT" \
              -e "$TG_URL" \
              -d "chat_id=$TG_USER_ID" \
              -d text="$tgMsg" \
              -d "disable_web_page_preview=true" \
              "$TG_URL" 2>&1)

echo "$tgpush" 1>&2              