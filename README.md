# Lockitron events ➡ Slack

Send Lockitron events to Slack to keep a log

## Set up

1. `bundle install`
2. Create a `.env` from the example

    - `SLACK_URL`: Grab a webhook URL from Slack for the channel you want.
    - `API_KEY`: A random string. Generate one by running `bin/generate-key`.
    - `RACK_ENV`: Should be `production` in production. Otherwise, doesn't matter.

3. Run locally with `rackup`

## Testing

### Against local server

```sh
bin/test
```

### Against other server

```sh
bin/test http://example.com abc123-my-api-key
```

API key will be taken from `.env` if not specified.
