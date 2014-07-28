.PHONY: install
install: all

all:
	@mkdir /etc/firewall
	@mkdir /etc/firewall/custom
	@echo "etc folder created"
	@install -m 755 firewall /etc/init.d/firewall
	@echo "Program added to init directory"
	@cp etc/firewall/*.conf /etc/firewall
	@update-rc.d firewall defaults
	@echo "The program is successfully installed"

.PHONY: uninstall
uninstall:
	@rm -rf /etc/firewall
	@echo "Removed /etc/firewall"
	@rm -rf /etc/init.d/firewall
	@echo "Removed /etc/init.d/firewall"
	@update-rc.d firewall remove
	@echo "The program is successfully uninstalled"
