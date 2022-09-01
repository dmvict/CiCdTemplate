#
# = common
#

# Comma
comma := ,

# Checks two given strings for equality.
eq = $(if $(or $(1),$(2)),$(and $(findstring $(1),$(2)),\
                                $(findstring $(2),$(1))),1)

#
# = Parameters
#

VERSION ?= $(strip $(shell grep -m1 'version = "' Cargo.toml | cut -d '"' -f2))

#
# = Git
#

# Synchronize local branch.
#
# Usage :
#	make git.sync m="commit message"

git.sync :
	git add --all && git commit -am "$(m)" && git pull && git push

sync : git.sync

#
# = General commands
#

# Generate crates documentation from Rust sources.
#
# Usage :
#	make doc [private=(yes|no)] [open=(yes|no)] [clean=(no|yes)]

doc :
ifeq ($(clean),yes)
	@rm -rf target/doc/
endif
	cargo doc --all-features --package editor_tui \
		$(if $(call eq,$(private),no),,--document-private-items) \
		$(if $(call eq,$(open),no),,--open)

# Format Rust sources with rustfmt.
#
# Usage :
#	make fmt [writing=(no|yes)]

fmt :
	cargo +nightly fmt --all $(if $(call eq,$(writing),yes),,-- --check)

# Lint Rust sources with Clippy.
#
# Usage :
#	make clippy

clippy :
	cargo clippy --all-features -- -D warnings

# Run Rust tests of project.
#
# Usage :
#	make test

test :
	cargo test --all-features

# Run format clippy test and tests.
#
# Usage :
#	make audit

audit : fmt clippy test

# Format nad lint Rust sources.
#
# Usage :
#	make lint

normalize : fmt lint

# Run project Rust sources with Cargo.
#
# Usage :
#	make up

up :
	cargo up

# Run project Rust sources with Cargo.
#
# Usage :
#	make clean

#
# = .PHONY section
#

.PHONY : \
	git.sync \
	doc \
	fmt \
	clippy \
	test \
	audit \
	normalize \
	up \
