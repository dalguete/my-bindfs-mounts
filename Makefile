# Define source and target.
SOURCE:=src/
TARGET:=/

# Define folders aimed to serve only this application. Useful when removing them
# when they are empty. Only name those as they appear under SOURCE folder (if any).
# If more than one level is set, list deepest entries first
# Separate them with white spaces.
ONLY_APP_FOLDERS:=

# Basic configs
.DEFAULT_GOAL:=info
all: info install uninstall
.PHONY: all

# Info Target.
info:
	@echo "Just some info!"

# Install Target.
install:
	@echo "Installing files..."
	@cp -rf $(wildcard $(SOURCE)*) $(TARGET)
	@echo "Done!"

# Uninstall Target.
uninstall:
	@echo "Uninstalling files..."
	@find $(SOURCE) -type f -or -type l | sed -e 's@^$(SOURCE)@$(TARGET)@' | xargs -I {} rm -fr {}
	@if [ -n "$(ONLY_APP_FOLDERS)" ]; then \
		echo "Removing empty folders..."; \
	fi;
	@for dir in $(ONLY_APP_FOLDERS); do \
		if [ ! -d "$(TARGET)$$dir" ]; then \
			echo "Directory '$(TARGET)$$dir' already removed!" 1>&2; \
			continue; \
		fi; \
		if [ ! -z "`ls -A $(TARGET)$$dir`" ]; then \
			echo "Directory '$(TARGET)$$dir' is not empty. Not removing!" 1>&2; \
			continue; \
		fi; \
		rm -rf "$(TARGET)$$dir"; \
	done
	@echo "Done!"
