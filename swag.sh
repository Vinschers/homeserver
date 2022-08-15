#!/bin/sh


# DuckDNS
{ echo "\$DUCKDNSSUBDOMAIN="; echo "\$DUCKDNSTOKEN="; } >> "$HOME/.env"

# SWAG
{ echo "\$SWAG_DNS="; echo "\$SWAG_VALIDATION="; } >> "$HOME/.env"
