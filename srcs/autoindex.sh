#!/bin/bash

if [ $1 = "off" ]
then
	sed -i -e "s/autoindex on/autoindex off /g" default 
fi

if [ $1 = "on" ]
then
	sed -i -e "s/autoindex off /autoindex on /g" default
fi
