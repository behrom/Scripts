#!/bin/bash

rm ~/.ssh/config
cp ~/.ssh/config.back ~/.ssh/config

echo -e  "\tUser $1@stud.uni.torun.pl" >> ~/.ssh/config

ssh router

