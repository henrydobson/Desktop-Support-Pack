USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=desktopSupportPack
PACKAGE_NAME=desktopSupportPack
REVERSE_DOMAIN=com.henrydobson
PAYLOAD=\
	pack-mailStationery \
	pack-script \
	pack-management \
	pack-script-preinstall \
	pack-script-postinstall

pack-mailStationery: l_Library_Application_Support
	@sudo mkdir -p ${WORK_D}/Library/Application\ Support/Apple/Mail/Stationery/Apple/Contents/Resources/
	@sudo ${CP} -R Resources/* ${WORK_D}/Library/Application\ Support/Apple/Mail/Stationery/Apple/Contents/Resources/
	@sudo chown root:wheel ${WORK_D}/Library/Application\ Support/Apple/Mail/Stationery/Apple/Contents/Resources/
	@sudo chmod 755 ${WORK_D}/Library/Application\ Support/Apple/Mail/Stationery/Apple/Contents/Resources/

pack-script: l_usr_local_outset_login-once
	@sudo mkdir -p ${WORK_D}/usr/local/outset/login-once
	@sudo ${CP} -R zdesktopSupportPack-0.0.1.sh ${WORK_D}/usr/local/outset/login-once/99-desktopSupportPack-0.0.1.sh
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset/login-once/99-desktopSupportPack-0.0.1.sh
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset/login-once/99-desktopSupportPack-0.0.1.sh
	@sudo chmod a+x ${WORK_D}/usr/local/outset/login-once/99-desktopSupportPack-0.0.1.sh

pack-management: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/
	@sudo ${CP} -R desktopSupportPack ${WORK_D}/Library/Management/desktopSupportPack
	@sudo chown -R root:wheel ${WORK_D}/Library/Management/desktopSupportPack/
	@sudo chmod -R 755 ${WORK_D}/Library/Management/desktopSupportPack/
