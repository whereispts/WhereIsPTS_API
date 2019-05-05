# Where is PTS

## Table of Contents

<!-- TOC -->

- [Where is PTS](#where-is-pts)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
    - [What is PTS](#what-is-pts)
  - [Installation](#installation)
    - [Dependencies](#dependencies)
    - [Environment](#environment)
  - [Usage](#usage)
    - [Deploy](#deploy)
    - [Run Unitttest](#run-unitttest)
  - [API documents](#api-documents)

<!-- /TOC -->

## Introduction

Because many stores' TV channels are locked in specific junk information channels. So I decided to develop a map website to mark the stores that broadcast high-quality TV programs, so that everyone can search and return the store information.

Thanks for the Web service by NoobTW.

### What is PTS

PTS is 'Public Television Service Foundation'

This is [english link](http://eng.pts.org.tw/)

## Installation

### Dependencies

* PostgreSQL
* Postgis
* libpq-dev

### Environment

1. **Install commom environment**

    ```bash
    sh ./install.sh
    ```

2. **Install python environment**

    - **development**

        ```bash
        pip3 install -r requirements/dev.txt
        ```

    - **prodution**

        ```bash
        pip3 install -r requirements/prod.txt
        ```

## Usage

1. **export environment**

    ```bash
    export FLASK_CONFIG="<env>"
    # `<env>` can be {development, testing, production, default}
    # export FLASK_CONFIG="development"
    ```

2. **edit config.py**

    ```bash
    vim config.py
    ```

    - you can use `secret` module generating the hash key

    ```bash
    import secrets
    secrets.token_hex(nbytes=16)
    ```

3. **migrate database**

    ```bash
    python3 manage.py db upgrade
    ```

4. **run**

    ```bash
    python3 manage.py run
    ```

### Deploy

```bash
sh ./deploy.sh
```

### Run Unitttest

```bash
sh ./tests/build.sh
env FLASK_CONFIG='testing' sudo -E python manage.py test
```

## API documents

```sh
npm install -g aglio
# or you can use yarn add
aglio -i docs/api.apib --theme-template triple -o index.html
python -m http.server
```
