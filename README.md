# auto-release-action

- Auto Release

- Example as [example.yml](example.yml)

- Adjust Dispatch On Schedult:

```yaml
on:
  schedule:
    - cron: '00 00 * * *'  #  Release Each Days
```

- need permissions:

```yaml
permissions:
  contents: write
```

- Need Input GITHUB_TOKEN on Dispatch:

```yaml
    steps:
      - uses: godners/Shared_actions/periodic-release@main
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
