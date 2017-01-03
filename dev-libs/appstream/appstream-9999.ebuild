# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_AUTODEPS="false"
KDE_TEST="true"
inherit kde5

DESCRIPTION="Cross-distro effort for providing metadata for software in the Linux ecosystem"
HOMEPAGE="https://www.freedesktop.org/wiki/Distributions/AppStream/"
EGIT_REPO_URI="https://github.com/ximion/${PN}"

LICENSE="LGPL-2.1+ GPL-2+"
# check APPSTREAM_LIB_API_LEVEL
SLOT="0/4"
IUSE="apt doc qt5"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libxml2:2
	dev-libs/libyaml
	dev-libs/snowball-stemmer
	qt5? ( dev-qt/qtcore:5 )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

src_configure() {
	local mycmakeargs=(
		-DSTEMMING=ON
		-DL18N=ON
		-DVAPI=OFF
		-DMAINTAINER=OFF
		-DSANITIZERS=OFF
		-DDOCUMENTATION=OFF
		-DAPT_SUPPORT=$(usex apt)
		-DINSTALL_PREBUILT_DOCS=$(usex doc)
		-DQT=$(usex qt5)
	)

	kde5_src_configure
}
