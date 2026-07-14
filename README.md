# Cron Backups 🐧

Bash program that is meant to run as a cron job on an old machine or Raspberry Pi for copying production data from VPS and storing them. It also handles things like removing old outdated backup files and logs.

It's build to be configurable with `.env` file to match everyone's needs.

## Purpose

The original idea was to save up on money by not paying VPS providers extra money for daily backups and do them on my own using an old laptop.

If you have an old computer laying around without doing anything, like it happened in my case. You can just utilise it run it as a backup service for your VPS. Just run it as a cron job with something like `0 0,12 * * * /home/user/cron-backup/main --silent` to backup your data at every 12 hours and it will handle the rest.

## Requirements

- Bash
- Linux

## Get Started

### 1. Create .env file

Create `.env` file and fill it in with your values.

```bash
cp .env.example .env
```

### 2. Run the script

Run the script to start the copying process.

```bash
./main
```

## Flags (Arguments)

| Full       | Short | Description                                     |
| ---------- | ----- | ----------------------------------------------- |
| `--help`   | `-h`  | Show help message                               |
| `--silent` | `-s`  | Redirect output to a log file instead of stdout |

## Notes

- When you SSH into your VPS, you should see any printed text as it will mess with `rsync` command tryting to sync files. The easiest way is to create an empty `.lesshst` file in your home directory which will remove all the login output.
- This script doesn't remove storage and backup files from your system if they are missing on VPS. If executed this script and then deleted some files on VPS, this script will still keep those deleted files on your host machine even though they are missing on VPS.

## License

The Cron Backups project is licensed under the [MIT License](https://github.com/SerhiiCho/cron-backups/blob/master/LICENSE)
