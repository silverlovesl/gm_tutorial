
install:
	@echo "Install package"
	@flutter pub get
freeze:
	@echo "Generate freeze"
	@flutter pub run build_runner build --delete-conflicting-outputs

freeze-watch:
	@echo "Watching freeze change, auto generate "
	@flutter packages pub run build_runner watch --delete-conflicting-outputs



.PHONY: freeze