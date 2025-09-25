#!/bin/bash

set -a
[ -f .env ] && source .env
exec ./bin/subscribe
