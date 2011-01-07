# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="koffice"
inherit kde4-meta

DESCRIPTION="KOffice flowchart application."
KEYWORDS=""
IUSE="debug python"

DEPEND="
	python? ( >=kde-base/pykde4-${KDE_MINIMAL} )
"
RDEPEND="${DEPEND}"

KMEXTRA="
	filters/${KMMODULE}
"
KMEXTRACTONLY="
	filters/
	libs/
	plugins/
"

KMLOADLIBS="koffice-libs"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with python PythonLibs)
	)

	kde4-meta_src_configure
}
