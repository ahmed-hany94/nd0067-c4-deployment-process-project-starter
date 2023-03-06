#!/usr/bin/env bash
set -x
set -e

AWS_CONFIG_FILE=$HOME/.aws/config

mkdir -p $HOME/.aws
touch $AWS_CONFIG_FILE
chmod 600 $AWS_CONFIG_FILE

aws configure set aws_access_key_id AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key AWS_SECRET_ACCESS_KEY
aws configure set region us-east-1
aws configure set aws_session_token ""
eb init

echo "[profile eb-cli]"                              > $AWS_CONFIG_FILE
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID"         >> $AWS_CONFIG_FILE
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> $AWS_CONFIG_FILE
