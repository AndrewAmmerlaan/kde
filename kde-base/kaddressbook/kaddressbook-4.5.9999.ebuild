# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KDE_HANDBOOK="optional"
KMNAME="kdepim"
inherit kde4-meta

DESCRIPTION="The KDE Address Book"
KEYWORDS=""
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdelibs 'semantic-desktop')
	$(add_kdebase_dep kdepimlibs 'semantic-desktop')
	$(add_kdebase_dep kdepim-common-libs)
"
RDEPEND="${DEPEND}"

KMEXTRA="
	plugins/kaddressbook/
	plugins/ktexteditor/
"
KMEXTRACTONLY="
	akonadi/
	libkleo/
"

KMLOADLIBS="kdepim-common-libs"

pkg_postinst() {
	kde4-meta_pkg_postinst

	if ! has_version kde-base/kdepim-kresources:${SLOT}; then
		echo
		elog "For groupware functionality, please install kde-base/kdepim-kresources:${SLOT}"
		echo
	fi
}
