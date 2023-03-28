.PHONY: build json release

json:
	@flutter pub run build_runner build

release:
	@flutter build apk --release --obfuscate --split-debug-info=./symbols

release_web:
    @flutter build web --release

build:
	@flutter build apk --debug
