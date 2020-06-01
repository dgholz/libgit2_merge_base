This is an example to reproduce a `Rugged::OdbError` failure in shallow clones.

Set up the repro by running:
```
git clone --depth=2 git@github.com:dgholz/libgit2_merge_base
cd libgit2_merge_base
git fetch --depth=2 origin topic:topic
git checkout topic
bundle install
bundle exec ruby show_merge_base.rb
```
It should show an error like:
```
Traceback (most recent call last):
	1: from show_merge_base.rb:9:in `<main>'
show_merge_base.rb:9:in `merge_base': object not found - no match for id (44bc4bcccb9b92394b87ec030a44803349dd34b5) (Rugged::OdbError)
```

If you do a full clone and then shallow it, remember to `git prune` to remove
the dangling commits! Otherwise, Rugged will find
44bc4bcccb9b92394b87ec030a44803349dd34b5 & not show an error.
