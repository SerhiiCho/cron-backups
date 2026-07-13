# Cron Backups 🐧

Bash program that is meant to run as a cron job on an old machine or Raspberry Pi for copying production data from VPS and storing them. It also handles things like removing old outdated backup files and logs.

It's build to be configurable with .env file to match everyone's needs.

## Purpose

The original idea was to save up on money by not paying VPS providers extra money for daily backups and do them on my own using an old laptop.

If you have an old computer laying around without doing anything, like it happened in my case. You can just utilise it run it as a backup service for your VPS. Just run it as a cron job with something like `0 0,12 * * * /app/cron-script` to backup your data at every 12 hours and it will handle the rest.

## Requirements

- Bash
- Linux

## Get Started

### 1. Create .env file

Create .env file and fill it in with your values.

```bash
cp .env.example .env
```

### 2. Run the script

Run the script to start the copying process.

```bash
./main
```

## License

The Cron Backups project is licensed under the [MIT License](https://github.com/SerhiiCho/cron-backups/blob/master/LICENSE)
