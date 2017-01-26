#!/bin/sh
# Script to remove indices from the elasticsearch cluster that are older than x # of days. By Ben Lavender.
#ES curator from https://github.com/elastic/curator will be called to remove the indices.

#Set days to required number #
#days=7
#Settings for email submissions:
#You need to change these for your mails
#RECSMTP=Recipient@domain.com,Recipient2@domain.com
#RELAYSVR=Relay_SMTP_Host>
#Set cluster hostname or IP address
#cluster_host=localhost

touch /var/log/curator_output.log || $curator_output='/var/log/curator_output.log'

curator --host $cluster_host delete indices --older-than $days --time-unit days --timestring '%Y.%m.%d' > /var/log/curator.output.log
mail -s 'Indice Clear Results' $RECSMTP < /var/log/curator_output.log
