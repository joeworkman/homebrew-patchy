# homebrew-patchy

Homebrew tap for [Patchy](https://github.com/joeworkman/patchy) — a patchy little PHP dev server for macOS (running Apache).

## Install

```bash
brew install joeworkman/patchy/patchy
```

Equivalent to:

```bash
brew tap joeworkman/patchy
brew install patchy
```

## Releasing a new version

1. In the [patchy](https://github.com/joeworkman/patchy) repo, tag and push a release:
   ```bash
   git tag v0.2.0
   git push origin v0.2.0
   ```
2. Compute the tarball SHA256:
   ```bash
   curl -sL https://github.com/joeworkman/patchy/archive/refs/tags/v0.2.0.tar.gz | shasum -a 256
   ```
3. In this repo, edit `Formula/patchy.rb` — bump `url` and `sha256`.
4. Verify locally:
   ```bash
   brew update
   brew upgrade joeworkman/patchy/patchy
   brew test patchy
   brew audit --strict patchy
   ```
5. Commit and push the formula bump.

## License

[MIT](LICENSE)
