<!-- foundation:identity -->
# probe-275ab6

A one-page guestbook: visitors type a short message and see the wall of all messages, newest first.

- Site: https://probe-275ab6.api.holode.xyz
- Support: support@probe-275ab6.api.holode.xyz
<!-- /foundation:identity -->

## What this is

A one-page guestbook: visitors type a short message and see the wall of all messages, newest first.

## Who it is for

- Visitor (no account needed)

## Main features

- **Leave a message** — Visitor types a short message (with optional name) and submits it from the single page.
- **View the wall** — The page lists all messages newest first, with author and time.

## Core entities

- Message

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Requires Ruby, PostgreSQL, and the usual Rails toolchain. See `bin/setup` if present.

## Demo

Three or four friendly placeholder guestbook entries from different authors so the wall doesn't look empty on first load.

## Deploy notes

Production `config.hosts` is derived from `domain` in `config/foundation.yml`. Keep that value aligned with the real host or every request will 403.
