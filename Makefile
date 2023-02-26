
install:
	@echo "Install package"
	@flutter pub get
freeze:
	@echo "Generate freeze"
	@flutter pub run build_runner build --delete-conflicting-outputs


.PHONY: freeze