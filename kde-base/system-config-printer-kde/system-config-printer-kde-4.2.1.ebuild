# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdeadmin"
inherit kde4-meta python

SYS_CONF_PR="system-config-printer-1.1.3"
SRC_URI="${SRC_URI}
	http://cyberelk.net/tim/data/system-config-printer/1.1/${SYS_CONF_PR}.tar.bz2
"

DESCRIPTION="KDE port of Red Hat's Gnome system-config-printer"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/PyQt4-4.4.4-r1[dbus]
	dev-python/pycups
	>=kde-base/pykde4-${PV}:${SLOT}[kdeprefix=]
"
RDEPEND="${DEPEND}
	net-print/cups[dbus]
"

SYS_CONF_PR_MODULES="{config.py,cupshelpers/,debug.py,smburi.py}"

src_unpack() {
	kde4-meta_src_unpack

	tar -C "${S}/"${PN} -xjf "${DISTDIR}"/${SYS_CONF_PR}.tar.bz2 `eval echo ${SYS_CONF_PR}/${SYS_CONF_PR_MODULES}` \
		--strip-components=1 || die "failed to unpack ${SYS_CONF_PR}"
}

src_prepare() {
	kde4-meta_src_prepare

	# Workaround sandbox violation
	sed -i -e '/PYKDE4_ADD_EXECUTABLE(system-config-printer-kde.py.*)/s/^/#DONOTINSTALL /' \
		${PN}/CMakeLists.txt || die "failed to disable automatic installation"

	# Update config.py
	sed -i \
		-e "s|^prefix=.*$|prefix=\"${KDEDIR}\"|" \
		-e "s|^datadir=.*$|datadir=\"${KDEDIR}/share\"|" \
		-e "s|^localedir=.*$|localedir=\"${KDEDIR}/share/locale\"|" \
		-e "s|^pkgdatadir=.*$|pkgdatadir=\"${KDEDIR}/share/apps/${PN}\"|" \
			${PN}/config.py || die "failed to update config.py"

	# Make it find our stripped system-config-printer
	export PYTHONPATH="${S}/${PN}:${PYTHONPATH}"
}

src_install() {
	kde4-meta_src_install

	# Do not compile python modules
	python_disable_pyc

	# Manually install some files
	fperms a+x "${KDEDIR}"/share/apps/${PN}/system-config-printer-kde.py \
		|| die "fperms failed"
	dosym "${KDEDIR}"/share/apps/${PN}/system-config-printer-kde.py \
		"${KDEDIR}"/bin/system-config-printer-kde || die "dosym failed"
	insinto "${KDEDIR}"/share/apps/${PN}
	doins -r `eval echo "${S}"/${PN}/${SYS_CONF_PR_MODULES}` \
		|| die "doins failed"
}
