# SCB backend

Backend for Simple Comme Bonjour build with Strapi

# Setup developpement

## install dependencies

- mysql

```sh
# Ubuntu
$ sudo apt-get install mysql

# OS X
$ brew install mysql

# Windows
$ choco install mysql
```

- dev dependencies
> npm install

## First run, create database

- create database

```sh
# Start mysql server
$ mysql.server start

# Connect to mysql server from console
$ mysql -uroot -proot

# Create database
mysql> CREATE DATABASE scb_development;
mysql> exit;

# Import database
$ mysql -uroot -proot < ./mock/scb_development.sql > ./mock/scb_develppment.log
```

- import images
> TODO

## Developpement

- Run backend on http://localhost:1337
> npm run develop

- Connect to admin console on http://localhost:1337/admin

// user : Vaite
// mdp: Vaite_scb